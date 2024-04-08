import 'package:flutter/material.dart';

import '../models/item_model.dart';

class ItemUserView extends StatelessWidget {
  late ItemData item;
  ItemUserView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.network(
                item.imageUrl!,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          Text(item.title ?? 'title'),
          Text(item.price ?? '\$\$\$'),
        ],
      ),
    );
  }
}
