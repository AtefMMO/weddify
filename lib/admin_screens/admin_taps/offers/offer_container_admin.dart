import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/offers/edit_offer_screen.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';
import 'package:weddify/merchant_screens/edit_item_screen.dart';

class offerContainerAdmin extends StatelessWidget {
late OfferData offer;
  offerContainerAdmin({required this.offer});
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
                deleteOffer(offer);
                Fluttertoast.showToast(
                    msg: "Offer Deleted Successfully",
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
                       offer.title??'title',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
       /*       InkWell(
                onTap: () {
                  showEditScreen(context,offer);
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
              )*/
            ],
          ),
        ),
      ),
    );
  }

  void showEditScreen(BuildContext context,OfferData offer) {
    showModalBottomSheet(
        context: context, builder: (context) => EditOfferScreen(offer: offer));
  }
  deleteOffer(OfferData offer){
    FirebaseUtilsOffer.deleteData(offer);
  }
}
