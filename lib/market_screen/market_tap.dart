import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/market_screen/merchant_container.dart';

class Market extends StatelessWidget {
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
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    ' Merchants',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                        MerchantContainer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
