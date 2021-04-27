import 'package:flutter/material.dart';
import 'package:flutterui3/Animations/fadeanimation.dart';
import 'package:flutterui3/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StartFood extends StatefulWidget {
  @override
  _StartFoodState createState() => _StartFoodState();
}

class _StartFoodState extends State<StartFood> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    var animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animationController = animationController;
    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/satu.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2)
          ])),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                    .5,
                    Text(
                      'Taking Order For Delivery',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1,
                    Text(
                      'See Restaurants nearby by / nadding location',
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, height: 1.4),
                    )),
                SizedBox(height: 100),
                FadeAnimation(
                    1.2,
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.orange])),
                          child: AnimatedOpacity(
                              opacity: _textVisible ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 50),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () => _onTap(),
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ))),
                    )),
                SizedBox(height: 20),
                FadeAnimation(
                    1.4,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        child: Text(
                          'Now Delivery  To You Door 24/7',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
