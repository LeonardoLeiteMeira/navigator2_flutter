import 'package:flutter/cupertino.dart';

import 'model/item_shop.dart';

class ShopController extends ChangeNotifier {
  ItemShop? _selectedItem;
  final List<ItemShop> _itensShopCart = [];
  bool _isFinishing = false;

  static final ShopController _shopController = ShopController._internal();
  ShopController._internal();
  factory ShopController() {
    return _shopController;
  }

  void selectItem(ItemShop itemShop) {
    _selectedItem = itemShop;
    notifyListeners();
  }

  void unselectItem() {
    _selectedItem = null;
    notifyListeners();
  }

  bool get isFinishing => _isFinishing;
  set isFinishing(bool value) {
    _isFinishing = value;
    notifyListeners();
  }

  ItemShop? get selectedItem => _selectedItem;

  bool get hasItemSelected => _selectedItem != null;

  void addItemInCart(ItemShop itemShop) {
    _itensShopCart.add(itemShop);
    notifyListeners();
  }

  bool removeItemFromCart(ItemShop itemToRemove) {
    var result = _itensShopCart.remove(itemToRemove);
    notifyListeners();
    return result;
  }

  bool get isCartEmpty => _itensShopCart.isEmpty;
  List<ItemShop> get itensShopCard => _itensShopCart;
}
