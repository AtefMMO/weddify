import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_screen.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_container_admin.dart';
import 'package:weddify/offers_screen/offer_container.dart';

class OffersAdmin extends StatelessWidget {
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
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showAddOfferScreen(context);
                    },
                    child: Text('Add offer'),
                  ),
                ),
                offerContainerAdmin(),
                offerContainerAdmin(),
                offerContainerAdmin(),
                offerContainerAdmin(),
              ],
            ),
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
