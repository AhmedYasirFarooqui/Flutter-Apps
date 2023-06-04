import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class SelectedFavouriteScreen extends StatelessWidget {
  const SelectedFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('build');
    final provider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites App'),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       Navigator.of(context).push(MaterialPageRoute(builder: (_) => ));
        //     },
        //     child: const Icon(Icons.favorite),
        //   ),
        //   const SizedBox(width: 20.0),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.selectedItem.length,
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
