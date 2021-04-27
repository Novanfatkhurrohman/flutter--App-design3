import 'package:flutter/material.dart';
import 'package:flutterui3/Animations/fadeanimation.dart';
import 'constant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Icon(null),
        elevation: 0,
        brightness: Brightness.light,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.grey[800]),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1,
                      Text('Food Delivery',
                          style: TextStyle(
                              color: Colors.grey[80],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FadeAnimation(
                              1, makeCategory(isActive: true, title: 'egg')),
                          FadeAnimation(1.3,
                              makeCategory(isActive: false, title: 'cake')),
                          FadeAnimation(
                              1.4, makeCategory(isActive: false, title: 'Sop')),
                          FadeAnimation(1.5,
                              makeCategory(isActive: false, title: 'bubur')),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ])),
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FadeAnimation(1, makeItem(image: 'assets/images/satu.jpg')),
                  FadeAnimation(1.4, makeItem(image: 'assets/images/dua.jpg')),
                  FadeAnimation(1.5, makeItem(image: 'assets/images/tiga.jpg')),
                  FadeAnimation(
                      1.6, makeItem(image: 'assets/images/empat.jpg')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
