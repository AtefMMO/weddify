import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';

class Offer extends StatelessWidget {
  OfferData offer;
  Offer({required this.offer});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Stack(
            children: [
              Image.network(
                offer.imgLink!,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
