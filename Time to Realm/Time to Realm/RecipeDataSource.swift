//
//  File.swift
//  Time to Realm
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation
import RealmSwift

class Recipe: Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var instructions: String
    @Persisted var image: String
    convenience init(_ name: String, _ instructions: String, _ image: String) {
        self.init()
        self.name = name
        self.instructions = instructions
        self.image = image
    }
}

class RecipeDataSource {
    private var realm: Realm
    
    init() {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            realm = try Realm(configuration: config)
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func create(recipe: Recipe) {
        do {
            try realm.write {
                realm.add(recipe, update: .modified)
            }
        } catch {
            print("Failed to create recipe: \(error)")
        }
    }
    
    func getByName(name: String) -> Recipe? {
        return realm.object(ofType: Recipe.self, forPrimaryKey: name)
    }
    
    func getAll() -> Results<Recipe> {
        realm.objects(Recipe.self)
    }
    
    
    func update(recipe: Recipe) {
        do {
            try realm.write {
                realm.add(recipe, update: .error)
            }
        } catch {
            print("Failed to update recipe: \(error)")
        }
    }
    
    func delete(name: String) {
        do {
            try realm.write {
                realm.delete(getByName(name: name)!)
            }
            
        } catch {
            print("Failed to delete recipe: \(error)")
        }
    }
    
    func searchByName(pattern: String) -> Results<Recipe> {
        return realm.objects(Recipe.self).filter("name CONTAINS[c] %@", pattern)
    }
    
}

let recipeOne = Recipe("Beet Greens and Poached Eggs",
                       #"Heat a small skillet over medium low heat with 2 of water until small bubble start to rise. Add a pinch of salt and vinegar. Gently crack eggs into the water, slowly sliding them into the water. Cover and allow to simmer for 8 10 minutes until white is set and yolks are still runny. For this dish you want a runny yolk.\nHeat a large nonstick skillet over medium heat with coconut oil. Add leeks and sliced beets. Cook for 5 8 minutes until beets and leeks are tender. Add garlic and chopped baby beet greens. Cook for two minutes stirring often, then remove from heat and continue to stir until beet greens lightly wilt. Add a splash of lemon juice.\nSplit greens among two plates and top each plate with a poached egg and a tablespoon of Parmesan cheese."#,
                       "https://spoonacular.com/recipeImages/634781-556x370.jpg")

let recipeTwo = Recipe("Arugula Salad With Pomegranate, Avocado and Goat Cheese",
                 #"<ol><li>Toss the salad ingredients in a medium bowl.</li><li>In a smaller bowl, mix the dressing ingredients and pour over the salad.</li><li>Sprinkle with course salt and freshly ground black pepper.</li></ol>"#,
                 "https://spoonacular.com/recipeImages/632788-556x370.jpg")

let recipeThree = Recipe("Tuscan White Bean Soup with Olive Oil and Rosemary",
                 #"<ol><li>Rinse the beans thoroughly and place them in a 7-quart slow cooker along with the water, onion, garlic, and bay leaf. Cover and cook on LOW for about 8 hours, or until the beans are nice and tender.</li><li>Remove the bay leaf. Using a handheld immersion blender, puree the remaining ingredients to the desired texture. Add the salt to taste.</li><li>Ladle the soup into bowls. Drizzle with the olive oil, sprinkle with rosemary, and serve.</li></ol>"#,
                 "https://spoonacular.com/recipeImages/664147-556x370.jpg")

let recipeFour = Recipe("Sticky Toffee Pudding",
                  #"<ol><li>Preheat the oven to 350 degrees.</li><li>Put the chopped dates into a bowl and sprinkle over 1 teaspoon of the baking powder.  Pour over the boiling water and stir slightly.  Leave to soak until soft and cooled.</li><li>Mix the flour, remaining 1 teaspoon baking powder and salt in a bowl and set aside.</li><li>In the bowl of a mixer, cream the butter and sugar until light and creamy.  Add the eggs, one at a time, mixing well after each addition.  Beat in the corn syrup and vanilla.  Add the date mixture and the flour mixture and beat until just mixed.</li><li>Spread the batter into a thoroughly greased 8  inch round or square cake pan.  Smooth the top and bake in the oven for 30  40 minutes, until a tester inserted in the middle comes out with a few crumbs clinging.</li><li>Meanwhile, make the toffee sauce.  Melt the butter in a saucepan then stir in the sugar until dissolved.  Stir in the heavy cream and salt and simmer over medium heat until thickened and reduced to about 2 1/2 cups.  Stir frequently and watch carefully so it does not overboil.</li><li>When the cake is done, remove from the oven and invert the cake onto a plate to loosen it from the pan.  Return the cake to the pan.  Poke holes all over the cake with a skewer or a fork.</li><li>Spoon over about a cup of the sauce. Leave the cake to soak for several hours, but it is best left overnight. When completely cool, loosely cover with foil and refrigerate until ready to serve.  If youd like, you can warm the cake gently in a low oven but watch it closely so the sauce doesnt burn.</li><li>Invert the saucy cake onto a platter.  Pour about a 1/2 cup more sauce over the cake and let it soak in for a few minutes.</li><li>Cut into wedges and serve with additional sauce poured on each slice.</li></ol>"#,
                  "https://spoonacular.com/recipeImages/661633-556x370.jpg")

let recipeFive = Recipe("Jambalaya Stew",
                  #"Add all ingredients except shrimp to a large pot on the stove. Mix thoroughly. Bring to a boil.\nReduce heat to medium low. Cover and simmer until vegetables are tender and rice is fluffy, about 35 minutes.\nAdd shrimp and re-cover. Continue to cook until shrimp are tender and cooked through, about 6 minutes.\nIf you like, season to taste with salt, black pepper, and additional hot sauce. Serve and enjoy!!!"#,
                  "https://spoonacular.com/recipeImages/648432-556x370.jpg")

let recipeTest = Recipe("Vegan Chocolate Banana Pie",
                    #"In a blender, add tofu and mix until creamy,\nAdd bananas.\nMelt chocolate in a bowl on top of a pot of boiling water\nAdd  chocolate to blender, add cornstarch and maple syrup.\nPour into a precooked pie crust, and place in the fridge for as long as possible."#,
                    "https://spoonacular.com/recipeImages/664408-556x370.jpg")

let recipes = [recipeOne, recipeTwo, recipeThree, recipeFour, recipeFive]

