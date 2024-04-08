import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weddify/market_screen/firebaseutils_market.dart';
import 'package:weddify/models/item_model.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketState(items: []));
getItems(String category)async{
  try {
    List<ItemData> itemsList =
        await FireBaseUtilsMarket.getAllMerchantItemsByCategory(category);
    emit(MarketState(items: itemsList)); // returns the offerList
  } catch (e) {
    print('Error: $e');
  }
}
}
