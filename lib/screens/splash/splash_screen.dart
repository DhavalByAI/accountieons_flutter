import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_card.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_bg.png',
            height: dheight,
            width: dwidth,
            fit: BoxFit.fill,
          ),
          Center(
            child: cCard(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/logo.png',
                      height: 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ctext('ACCOUNTIEONS',
                        latterSpacing: 5,
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 54),
                      child: Row(
                        children: [
                          Expanded(
                              child: cCard(height: 3, color: Colors.white30)),
                          ctext('   INVOICE, BILLING, REPORTS   ',
                              color: Colors.white30, fontSize: 12),
                          Expanded(
                              child: cCard(height: 3, color: Colors.white30))
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
