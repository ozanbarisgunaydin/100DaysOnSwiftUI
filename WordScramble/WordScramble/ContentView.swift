//
//  ContentView.swift
//  WordScramble
//
//  Created by Ozan Barış Günaydın on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords: [String] = []
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .toolbar {
                    Button("New Word!", action: startGame)
                }
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) { } message: {
                    Text(errorMessage)
                }
            }
            VStack {
                Text("Total Score")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("\(score)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }

            .frame(maxWidth: .infinity, maxHeight: 256)
            .background(
                LinearGradient(
                    colors: [.red.opacity(0.4), .blue.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .padding()
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isEnoughLength(word: answer) else {
            wordError(title: "Word not enough length", messsage: "The word must be more than 2 letters!")
            return
        }
        
        guard isDifferentFromStartWord(word: answer) else {
            wordError(title: "Word not computed", messsage: "Write different then the root word!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", messsage: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", messsage: "You cannot spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", messsage: "You cannot just make them up!")
            return
        }
        
        withAnimation {
            score += answer.count
            usedWords.insert(answer, at: 0)
            newWord = ""
        }
    }
    
    func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
              let startWords = try? String(contentsOf: startWordsURL) else {
            fatalError("Could not load `start.text` from bundle")
        }
        
        let allWords = startWords.components(separatedBy: "\n")
        rootWord = allWords.randomElement() ?? "silkworm"
        
        usedWords = []
        score = 0
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            guard let pos = tempWord.firstIndex(of: letter ) else {
                return false
            }
            tempWord.remove(at: pos)
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(
            location: 0,
            length: word.utf16.count
        )
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    func isEnoughLength(word: String) -> Bool {
        word.count > 2
    }
    
    func isDifferentFromStartWord(word: String) -> Bool {
        word != rootWord
    }
    
    func wordError(title: String, messsage: String) {
        errorTitle = title
        errorMessage = messsage
        showingError = true
    }
}

#Preview {
    ContentView()
}
