import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';

class AddOfferScreen extends StatefulWidget {
  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  var formKey = GlobalKey<FormState>();

  String offerName = 'Offer title', offerDescription = 'Offer description';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Text(
              'Add Offer',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Offer title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Offer Name';
                            }
                          },
                          onChanged: (value) {
                            offerName = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Offer description',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Offer description';
                            }
                          },
                          onChanged: (value) {
                            offerDescription = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              addOffer();
                            },
                            child: const Text(
                              'Add Offer',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void addOffer() async {
    if (formKey.currentState!.validate()) {
      OfferData offer = OfferData(
        title: offerName,
        description: offerDescription,
      );

      try {
        await FirebaseUtilsOffer.addOfferToFirebase(offer);
        print('Offer Added Successfully');
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Offer Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        print('Error adding offer: $e');
        // Handle error adding offer to Firebase
        Fluttertoast.showToast(
          msg: "Failed to add offer Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
