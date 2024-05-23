import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(builder: (context, resturant, child) {
      //cart
      final userCart = resturant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        //cancel button
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel")),
                        //yes button
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              resturant.clearCart();
                            },
                            child: const Text("Yes")),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            // list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ? 
                  const Expanded(
                    child: Center(
                    child: Text("Cart is empty..",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
                    ),),
                  ) 
                  :Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        //get individual cart item
                        final CartItem = userCart[index];
              
                        //return cart tile UI
                        return MyCartTile(cartItem: CartItem);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // button to pay
            myButton(text: "Go to checkout", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentPage(),),
            ),),
            const SizedBox(height: 25,),
          ],
        ),
      );
    });
  }
}
