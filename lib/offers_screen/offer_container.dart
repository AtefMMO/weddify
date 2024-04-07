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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            Center(child: Text(offer.title ?? 'Offer')),
            Center(child: Text(offer.description ?? 'description')),
          ],
        ),
      ),
    );
  }
}
