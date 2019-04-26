import 'package:flutter/material.dart';
import 'package:onboarding/data_tutorial.dart';
import 'package:onboarding/page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );

    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFFBBDEFB), Color(0xFF1565C0)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(page.image),
                              
                              Container(
                                margin: EdgeInsets.only(top: 15.0, left: 12.0),
                                height: 100.0,
                                child: Stack(
                                  children: <Widget>[
                                    Text(page.title, style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                              
                              Container(
                                margin: EdgeInsets.only(top: 0.0),
                                child:  
                                  Text(page.text, style: TextStyle(color: Colors.white, fontSize: 20.0), textAlign: TextAlign.center)
                              ),
                              
                            ]
                          )
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 38.0,
              child: Container(
                  width: 210.0,
                  child: PageIndicator(currentPage, pageList.length)),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF0D47A1),
                        ),
                        onPressed: () { },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}