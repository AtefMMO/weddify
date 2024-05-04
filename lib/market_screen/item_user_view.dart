import 'package:flutter/material.dart';
import 'package:weddify/market_screen/item_full_screen.dart';

import '../models/item_model.dart';

class ItemUserView extends StatelessWidget {
  late ItemData item;
  ItemUserView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ItemDetailsScreen(item);
                  },
                ),
              );
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.47,
                child: Image.network(
                  item.imageUrl!,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
          ),
          Text('title: ${item.title}'),
          Text('price: ${item.price}'),
          Text('sold by: ${item.seller}'),
        ],
      ),
    );
  }
}
