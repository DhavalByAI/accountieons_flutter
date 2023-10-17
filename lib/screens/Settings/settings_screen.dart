import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Setting_item_widget.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cAppBar(
            pageName: 'Settings',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: cCard(
                color: Colors.white,
                shadow: true,
                child: GetBuilder<SettingsController>(
                  initState: (_) {},
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SettingItem(_.settingItems[index]);
                          },
                          itemCount: _.settingItems.length),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
