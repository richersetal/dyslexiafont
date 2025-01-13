import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomepageState();
}

class _HomepageState extends State<MyHomePage> {
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Aangepaste pop-up',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Sluit de dialoog
                  },
                  child: Text('Sluit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor, eros in ultricies tempus, nunc mauris laoreet sapien, vel facilisis metus nulla id urna. Donec congue nisi eu nisl pretium, eget eleifend urna sollicitudin. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque in ultrices turpis. Integer feugiat risus eu justo tincidunt, a scelerisque libero hendrerit. Vivamus scelerisque, sapien vel tincidunt dapibus, nisi justo auctor orci, vel ultricies elit ligula non metus.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            // Knop om de pop-up te tonen
            ElevatedButton(
              onPressed: () {
                _showCustomDialog(context);
              },
              child: Icon(Icons.font_download),
            ),
          ],
        ),
      ),
    );
  }
}
