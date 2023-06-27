import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/providers/meals_provider.dart';

enum Filter {
  cheesFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.cheesFree: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state[filter] = isActive;
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final fliltersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(fliltersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.cheesFree]! && !meal.isGlutenFree) {
      return false;
    }
    return true;
  }).toList();
});
