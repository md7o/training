import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/models/meal.dart';

class FavortieMealsNotifier extends StateNotifier<List<Meal>> {
  FavortieMealsNotifier() : super([]);

  bool toggleMealFaboriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => meal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavortieMealsNotifier, List<Meal>>(
  (ref) {
    return FavortieMealsNotifier();
  },
);
