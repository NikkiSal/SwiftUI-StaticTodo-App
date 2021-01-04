//
//  ContentView.swift
//  SwiftUI-Todo-App
//
//  Created by Nikki on 2021-01-03.
//

import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo] =
        [.init(description: "review first chapter", done: false),
         .init(description: "buy coconut water", done: false),
         .init(description: "paint kitchen", done: false),
         .init(description: "cut the grass", done: false)]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) {todo in
                    HStack {
                        Text(todo.description)
                            .strikethrough(todo.done)
                        Spacer()
                        Image(systemName: todo.done ? "checkmark.square" : "square")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        todos.toggleDone(to: todo)
                    }
                }
            }.navigationBarTitle("TODOs")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Todo: Identifiable, Equatable {
    let id = UUID()
    let description : String
    var done: Bool
    
}

// "the todo variable passed in the block of ForEach is a constant, so we create a function in the array of the todo to mutate the corresponding element there"

private extension Array where Element == Todo { // huh?
    mutating func toggleDone(to todo: Todo) {
        guard let index = self.firstIndex(where: { $0 == todo}) else {return}
        self[index].done.toggle()
    }
}
