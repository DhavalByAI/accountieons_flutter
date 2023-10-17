import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/form_field.dart';
import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cAppBar(
            pageName: 'General Settings',
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                cFormField(title: 'Business Currency'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
