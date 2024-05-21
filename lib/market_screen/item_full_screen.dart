import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/models/item_model.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen([this.item]);
  ItemData? item;
  static const String routeName = 'ItemDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[AppTheme.orangeColor, AppTheme.blueColor])),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(item!.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppTheme.lightGrey,
                height: MediaQuery.of(context).size.height * .5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      item!.imageUrl!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Text(
                'Title: \n',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                item!.title!,
                style: TextStyle(fontSize: 18),
                textDirection: TextDirection.rtl,
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
              const Text(
                'Description: \n',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                item!.description!,
                style: TextStyle(fontSize: 18),
                textDirection: TextDirection.rtl,
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
