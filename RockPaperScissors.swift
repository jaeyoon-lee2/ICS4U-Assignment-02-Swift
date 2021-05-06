/*
This program plays Rock, Paper, Scissors game with a computer.
author  Jay Lee
version 1.0
since   2021-05-09
*/

enum InvalidInputError : Error {
  case invalidInput
}

enum Choice : Int, CaseIterable {
  case ROCK = 0
  case PAPER = 1
  case SCISSORS = 2

  static func withLabel(_ label: String) -> Choice? {
    return self.allCases.first{ "\($0)" == label }
  }
}

var result: String = ""

// Input
print("Rock, Paper, Scissors?\nYOU: ", terminator: "")
let userInput = String(readLine()!)

// Generate random number for computer's choice
let randomChoice = Int.random(in: 0..<3)

do {
  guard let userChoice = Choice.withLabel(userInput.uppercased()) else{
    throw InvalidInputError.invalidInput
  }
  // Check win, lose or tie
  if (userChoice.rawValue == randomChoice) {
    result = "tie!"
  } else if (userChoice.rawValue == (randomChoice + 1) % 3) {
    result = "win!"
  } else {
    result = "lose!"
  }
  // Convert computer's choice to String ex: ROCK => Rock
  var computerChoice = "\(Choice.allCases[randomChoice])"
  computerChoice = Array(computerChoice)[0].uppercased()
                    + computerChoice.lowercased().dropFirst()

  // Output
  print("COM: \(computerChoice)")
  print("You \(result)")
} catch {
  print("Invalid input!")
}

print("\nDone.")
