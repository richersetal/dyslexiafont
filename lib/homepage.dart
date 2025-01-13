import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomepageState();
}

class _HomepageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 250),
            Center(
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor, eros in ultricies tempus, nunc mauris laoreet sapien, vel facilisis metus nulla id urna. Donec congue nisi eu nisl pretium, eget eleifend urna sollicitudin. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque in ultrices turpis. Integer feugiat risus eu justo tincidunt, a scelerisque libero hendrerit. Vivamus scelerisque, sapien vel tincidunt dapibus, nisi justo auctor orci, vel ultricies elit ligula non metus.'),
            )
          ],
        ),
      ),
    );
  }
}
