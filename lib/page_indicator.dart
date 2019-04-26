import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive, int i) {
    
    return Expanded(
      
        child: Container(
          width: 43.0,
          height: 43.0,
        
          decoration: BoxDecoration(
              color: isActive ? Colors.white : Color(0xFF0D47A1),
              shape: BoxShape.circle,
              
              boxShadow: [
                new BoxShadow(
                  color: isActive ? Colors.white : Color(0xFF0D47A1),
                  offset: new Offset(0.0, 0.0),
                  blurRadius: 0.2,
                  spreadRadius: 6.0
                )
              ],
              image: new DecorationImage(
                image: new AssetImage('assets/images/'+i.toString()+'.png'),
              ),
        ),
      )
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true, i+1) : _indicator(false,i+1));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}
