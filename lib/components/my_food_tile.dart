import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name,
                      style: 
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                      Text("\$"+food.price.toString(),
                      style: 
                      TextStyle(color: Theme.of(context).colorScheme.primary),),
                      Text(food.description,
                      style: 
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),),
                  const SizedBox(width: 25,),
              //food image
              ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(food.imagePath,height: 110,),
              ),
              ],
            ),
          ),
        ),
        //Divider
        Divider(
          color: Theme.of(context).colorScheme.primary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
