import 'package:counter_provider/provider/favourite_provider.dart';
import 'package:counter_provider/screens/favourite/selected_favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SelectedFavouriteScreen(),
                ),
              );
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('item $index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
