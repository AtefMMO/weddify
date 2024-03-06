import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';

class EditOfferScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

late OfferData offer;





EditOfferScreen({required this.offer});

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
              'Edit Offer',
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
                          initialValue: offer.title,
                          decoration: InputDecoration(
                              hintText: 'Enter Offer title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Offer Name';
                            }
                          },
                          onChanged: (value) {
                            offer.title = value;
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: offer.description,
                          decoration: InputDecoration(
                            hintText: 'Enter Offer description',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Offer description';
                            }
                          },
                          onChanged: (value) {
                            offer.description = value;
                          },
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                               editOffer(context);
                              }
                            },
                            child: const Text(
                              'Edit Offer',
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

  editOffer(BuildContext context){

    FirebaseUtils.updateData(offer
       );
    Navigator.pop(context);

    Fluttertoast.showToast(
        msg: "Task Edited Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
