//
//  main.swift
//  Time to Realm
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation
import RealmSwift

let recipeDS = RecipeDataSource()

recipes.forEach { recipe in
    recipeDS.create(recipe: recipe)
}

let storedRecipes = recipeDS.getAll()
print("\nRecipes:")
storedRecipes.forEach { recipe in
    print("\t\(recipe.name)")
}
print()

print("Deleting first recipe")
recipeDS.delete(name: storedRecipes[0].name)

print("\nRecipes:")
storedRecipes.forEach { recipe in
    print("\t\(recipe.name)")
}
print()

print("Find recipes with pattern \"egg\":")
let withEggs = recipeDS.searchByName(pattern: "egg")

print("Recipes with \"egg\":")
withEggs.forEach { recipe in
    print("\t\(recipe.name)")
}
print()

print("Find recipes with pattern \"and\":")
let withAnds = recipeDS.searchByName(pattern: "and")

print("Recipes with \"and\":")
withAnds.forEach { recipe in
    print("\t\(recipe.name)")
}
print()

let pattern = "Sticky Toffee Pudding"
print("Find recipes with pattern \"\(pattern)\":")
let withPattern = recipeDS.searchByName(pattern: pattern)

print("Recipes with \"\(pattern)\":")
withPattern.forEach { recipe in
    print("\t\(recipe.name)")
}
print()

print("Find recipes with pattern \"fibonacci\":")
let withFibonaccies = recipeDS.searchByName(pattern: "fibonacci")

print("Recipes with \"fibonacci\":")
withFibonaccies.forEach { recipe in
    print("\t\(recipe.name)")
}
print()
