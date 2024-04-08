import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/merchant_screens/item_container.dart';

import 'package:weddify/models/item_model.dart';

class ItemsScreen extends StatefulWidget {
  final String id;

  const ItemsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState(id: id);
}

class _ItemsScreenState extends State<ItemsScreen> {
  final String id;
  List<ItemData> items = [];
  bool isLoading = true;

  _ItemsScreenState({required this.id});

  void loadItems() async {
    setState(() {
      isLoading = true;
    });

    items = await FirebaseUtilsMerchant.getItemFromFireBase(id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Item(
                      item: items[index],
                    );
                  },
                  itemCount: items.length,
                ),
        ),
      ],
    );
  }
}
