import Foundation


let students: [String] = ["Alice", "Bob", "Carlos", "Diana", "Eve"]

var studentGrades: [String: [Double]] = [
    "Alice": [88, 92.5, 79, 85],
    "Bob": [95, 90, 93],
    "Carlos": [72, 68.5, 70],
    "Diana": [100, 98.5, 99, 97.5],
    "Eve": []
]

print("Student Record Summary:")

for name in students {
    guard let grades = studentGrades[name] else {
        
        print("Student \(name): No grades recorded.")
        continue
    }

    if grades.isEmpty {
        print("Student \(name): No grades recorded.")
        continue
    }

    var total = 0.0
    for g in grades {
        total += g
    }

    let average = total / Double(grades.count)
    let averageStr = String(format: "%.2f", average)
    print("Student \(name): Average grade = \(averageStr).")
}
