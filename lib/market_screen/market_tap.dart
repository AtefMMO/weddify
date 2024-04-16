import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/market_screen/merchant_container.dart';

class Market extends StatelessWidget {
  List <String> categories=['اجهزة منزلية','ادوات منزلية','أثاث','مفروشات','قاعات','شركات ليموزين','مطابخ','ادوات كهربائية','ادوات صحية','ديكورات'];
  @override
  Widget build(BuildContext context) {
    return Container(color: AppTheme.secondaryColor,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  ' Merchants',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                 return MerchantContainer(category: categories[index],);
                },itemCount: categories.length,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
