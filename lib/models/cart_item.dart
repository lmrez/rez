import 'package:food_delivery/models/food.dart';

class CartItem {
  Food food;
  List<Addon> SelectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.SelectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        SelectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
