import 'package:flutter/material.dart';
import 'package:training/models/category.dart';
import 'package:training/models/meal.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Burgers',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.seriouseats.com/thmb/CpfMCdoSDXTdR6C0KXEiIvM-9Jc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2014__08__20140818-tomato-sauce-vicky-wasik-3-5a82a74045764203a01410754b129601.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Chees (optional)'
    ],
    steps: [
      'Cook the oil, garlic, 1/2 teaspoon salt',
      'Add the tomatoes; rinse the can with about 1 cup of water',
      'Meanwhile, add the spaghetti to the boiling water',
      'Add the cooked spaghetti to the sauce, and stir to coat. Serve with Parmesan if desired',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c1',
      'c2',
      'c3',
    ],
    title: 'Chees Burger',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.eatclub.tv/wp-content/uploads/sites/4/2022/02/smashed-bacon-cheeseburger.jpg?w=1200',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Chees (optional)'
    ],
    steps: [
      'Cook the oil, garlic, 1/2 teaspoon salt',
      'Add the tomatoes; rinse the can with about 1 cup of water',
      'Meanwhile, add the spaghetti to the boiling water',
      'Add the cooked spaghetti to the sauce, and stir to coat. Serve with Parmesan if desired',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  )
];
