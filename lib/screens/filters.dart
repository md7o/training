import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(fliltersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.cheesFree]!,
            onChanged: (isChecked) {
              ref
                  .read(fliltersProvider.notifier)
                  .setFilter(Filter.cheesFree, isChecked);
            },
            title: Text(
              'chees-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include chees-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
