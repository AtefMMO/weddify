import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/merchant_screens/edit_item_screen.dart';
import 'package:weddify/models/item_model.dart';

import '../constants.dart';

class Item extends StatelessWidget {
 late ItemData item;
  Item({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
               deleteItem(uid!, item);//user id and item data
                Fluttertoast.showToast(
                    msg: "Item Deleted Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.01,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                       item.title??'item',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        item.category??'non',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showEditScreen(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showEditScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => EditItemScreen());
  }
  deleteItem(String id,ItemData item){
    FirebaseUtilsMerchant.deleteData(item, id);
  }
}
