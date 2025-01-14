import 'package:com_richersetal_dyslexiafont/constants/buttons.dart';
import 'package:com_richersetal_dyslexiafont/presentation/widgets/dialogs/font_settings_dialog.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomepageState();
}

class _HomepageState extends State<MyHomePage> {
  void _showCustomDialog(BuildContext context) {
    // here use FontSettingsDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FontSettingsDialog(); // use custom dialog window
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dyslexia Font'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor, eros in ultricies tempus, nunc mauris laoreet sapien, vel facilisis metus nulla id urna. Donec congue nisi eu nisl pretium, eget eleifend urna sollicitudin. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque in ultrices turpis. Integer feugiat risus eu justo tincidunt, a scelerisque libero hendrerit. Vivamus scelerisque, sapien vel tincidunt dapibus, nisi justo auctor orci, vel ultricies elit ligula non metus.',
                style: const TextStyle(fontSize: 16), // No hardcode
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                _showCustomDialog(context); // Open dialog window for font
              },
            ),
          ],
        ),
      ),
    );
  }
}
