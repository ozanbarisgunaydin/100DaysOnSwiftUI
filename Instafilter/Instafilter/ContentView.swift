//
//  ContentView.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()

    var body: some View {
        NavigationStack {
        ScrollView {
                VStack {
                    Spacer()
                    
                    PhotosPicker(selection: $selectedItem) {
                        if let processedImage {
                            processedImage
                                .resizable()
                                .scaledToFit()
                        } else {
                            ContentUnavailableView(
                                "No picture",
                                systemImage: "photo.badge.plus",
                                description: Text("Tap to import a photo")
                            )
                            .frame(
                                minHeight: 256
                            )
                            .gradientBorder()
                        }
                    }
                    .buttonStyle(.plain)
                    .onChange(of: selectedItem, loadImage)
                    
                    Spacer(minLength: 20)
                    
                    VStack {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity, applyProcessing)
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius, applyProcessing)
                        Text("Scale")
                        Slider(value: $filterScale)
                            .onChange(of: filterScale, applyProcessing)
                    }
                    .padding()
                    .gradientBorder()
                    
                    Spacer(minLength: 20)

                    HStack {
                        Button("Change Filter", action: changeFilter)
                            .fontWeight(.semibold)
                            .padding()
                            .gradientBorder()
                        
                        Spacer()
                        if let processedImage {
                            ShareLink(
                                item: processedImage,
                                preview: SharePreview("Instafilter Image", image: processedImage)
                            )
                            .fontWeight(.semibold)
                            .padding()
                            .gradientBorder()

                        }
                    }
                    .disabled(processedImage == nil)
                    
                }
                .padding([.horizontal, .bottom])
                .navigationTitle("Instafilter")
                .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                    Button("Crystallize") { setFilter(CIFilter.crystallize())}
                    Button("Edges") { setFilter(CIFilter.edges())}
                    Button("Gaussion Blur") { setFilter(CIFilter.gaussianBlur())}
                    Button("Pixellate") { setFilter(CIFilter.pixellate())}
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone())}
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask())}
                    Button("Vignette") { setFilter(CIFilter.vignette())}
                    Button("Cancel", role: .cancel) { }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            
            .background(
                LinearGradient(colors: [.cyan.opacity(0.2), .green.opacity(0.2)], startPoint: .topTrailing, endPoint: .bottomLeading)
            )
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self),
                  let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage,
              let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }

    @MainActor /// Swift not guarantee this function works on main thread. Thus, we should make it with this @MainActor
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 20 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
