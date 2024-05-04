import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/models/item_model.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen([this.item]);
  ItemData ?item;
  static const String routeName='ItemDetailsScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        title: Text(item!.title!),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item!.imageUrl!,
                  width: double.infinity,
                  height: 200, // Set the desired height here
                  fit: BoxFit.cover, // Adjust the fit to cover the entire space
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sold by: ${item!.seller!}',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
               'Description: \n ${item!.description!}',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Category: ${item!.category!}',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Price: ${item!.price!} egp',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}