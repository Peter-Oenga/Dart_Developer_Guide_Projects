import 'package:flutter/material.dart';
import '../data.dart'; // Ensure this contains `featuredGames`

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight;
  double? _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [_featuredGamesWidget()],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    debugPrint("Image URL: ${featuredGames[0].coverImage.url}");
    return SizedBox(
      height: _deviceHeight! * 0.50,
      width: _deviceWidth!,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(featuredGames[0].coverImage.url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
