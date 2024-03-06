

import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_screen.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_container_admin.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';

class OffersAdmin extends StatefulWidget {
  @override
  State<OffersAdmin> createState() => _OffersAdminState();
}

class _OffersAdminState extends State<OffersAdmin> {
  late List<OfferData> offers;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    CircularProgressIndicator();
    loadOffers();
  }

  void loadOffers() async {
    // Set isLoading to true when loading starts
    setState(() {
      isLoading = true;
    });

    // Retrieve offers asynchronously and assign them to the offers variable
    offers = await FirebaseUtils.getOfferFromFireBase();

    // Set isLoading to false when loading finishes
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/startScreen.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            children: [
              Row(

                children: [
                  ElevatedButton(
                    onPressed: () {
                      showAddOfferScreen(context);

                    },
                    child: Text('Add offer'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      loadOffers();

                    },
                    child: Text('ReLoad'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

              isLoading ?Center(child: CircularProgressIndicator(color: Colors.white,)):   Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return offerContainerAdmin(
                    offer: offers[index],);
                  },
                  itemCount: offers.length,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void showAddOfferScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddOfferScreen());
  }
}
