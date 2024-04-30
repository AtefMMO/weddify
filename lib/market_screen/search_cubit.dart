import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weddify/market_screen/friebaseutils_search.dart';
import 'package:weddify/models/item_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(items: []));
  getItems(String itemName)async{
    try{
      List<ItemData> itemList= await FireBaseUtilsSearch.getAllMerchantItemsByName(itemName);
      emit(SearchState(items: itemList));
    }catch(e){
      print('Error : $e');
    }
  }
  clearItems () {
    emit(SearchState(items: []));
}
}
