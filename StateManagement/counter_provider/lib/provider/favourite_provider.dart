import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _selectedItems = [];

  List<int> get selectedItem => _selectedItems;

  void addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
