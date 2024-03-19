import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/offers_screen/offer_container.dart';
import 'package:weddify/offers_screen/offers_cubit.dart';

class Offers extends StatelessWidget {
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
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' Find the Best',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                Text(
                  ' Deals, Anytime,\n Anywhere!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                BlocBuilder<OffersCubit, OffersState>(
                  builder: (context, state) {
                    if (state.offer.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.offer.length,
                          itemBuilder: (context, index) {
                            return Offer(
                              offer: state.offer[index],
                            );
                          },
                        ),
                      );
                    } else {
                      BlocProvider.of<OffersCubit>(context).getOffersList();
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
