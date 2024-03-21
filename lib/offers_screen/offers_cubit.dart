import 'package:bloc/bloc.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';

import 'package:weddify/admin_screens/admin_taps/offers/offer_model.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersState(offer: []));
  getOffersList() async {
    try {
      List<OfferData> offersList =
          await FirebaseUtilsOffer.getOfferFromFireBase();
      emit(OffersState(offer: offersList)); // returns the offerList
    } catch (e) {
      print('Error: $e');
    }
  }
}
