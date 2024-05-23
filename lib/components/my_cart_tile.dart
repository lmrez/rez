import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem,});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(
        builder: (context, resturant, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          ),
                        ),
                          const SizedBox(width: 10,),
                        //name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //food name
                            Text(cartItem.food.name),
                    
                            //food price
                    
                            Text('\$${cartItem.food.price}'),
                            
                            
                            QuantitySelector(
                          quantity: cartItem.quantity, 
                          food: cartItem.food, 
                          onIncrement: (){
                            resturant.addToCart(cartItem.food, cartItem.SelectedAddons);
                          }, 
                          onDecrement: (){
                            resturant.removeFromCart(cartItem);
                          })


                          ],
                        ),

                        const Spacer(),
                        
                      ],
                    ),
                  ),
                  // addons
                  SizedBox(
                    height: cartItem.SelectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,),
                      scrollDirection: Axis.horizontal,
                      children: cartItem.SelectedAddons.map((addon) => Padding(
                        padding: const EdgeInsets.only(right: 8,),
                        child: FilterChip(
                          label: Row(
                            children: [
                                //addon name
                                Text(addon.name,
                                style: TextStyle(color: 
                                Theme.of(context).colorScheme.primary,
                                ),),
                        
                                //addon price
                                Text( ' (\$${addon.price} ) ',
                                style: TextStyle(color: 
                                Theme.of(context).colorScheme.primary,),
                                ),
                            ],
                          ), 
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onSelected: (value) {},
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                          ),
                      ),
                        ).toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}
