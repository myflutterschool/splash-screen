import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_splash_screen/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double initOpacity = 0.0;
  bool isVisibleLoading = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () {
      initOpacity = 1.0;
      isVisibleLoading = true;
    });

    startTime();

    super.initState();
  }

  startTime() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        shadowColor: Colors.transparent,
      ),
      body: _body(),
    );
  }

  Widget _body() => Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.blue.shade800),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _image(),
            _descriptionText(),
            Expanded(child: _loading())
          ],
        ),
      );

  Widget _loading() => isVisibleLoading
      ? Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Lottie.asset('lib/assets/loadingshop.json', height: 50))
      : const SizedBox.shrink();

  Widget _image() => Image.asset('lib/assets/images/shop.png');

  Widget _descriptionText() => AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: initOpacity,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeToOnlineShop(),
              const SizedBox(
                height: 5,
              ),
              _enjoyShopping()
            ],
          ),
        ),
      );

  Widget _enjoyShopping() => Text(
        'Enjoy shopping in this store',
        style: TextStyle(
            color: Colors.yellow.shade700,
            fontSize: 14,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w400),
      );

  Widget _welcomeToOnlineShop() => Row(
        children: [
          const Text(
            'Welcome to ',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.3,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              Text(
                'Online      hop',
                style: TextStyle(color: Colors.yellow.shade400, fontSize: 26),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 42,
                  child: Image.asset('lib/assets/images/shop_logo.png'))
            ],
          )
        ],
      );
}
