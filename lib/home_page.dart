import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    //animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    //rotation animation
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    //radius animation
    _radiusAnimation = Tween<double>(
      begin: 450,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    //make animation go back and forth
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            //bigest object
            Transform.rotate(
              angle: _rotationAnimation.value ,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  // shape: BoxShape.circle,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF692D94).withOpacity(0.8),
                    offset:const Offset(-6, -6), // changes position of shadow
                  
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset:const Offset(6, 6), // changes position of shadow
                  ),]

                ),
            ),
            ),
      
            //second biggest object
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2 ,
              child: Container(
                width: 175,
                height: 175,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[500],
                  borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  // shape: BoxShape.circle,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF692D94).withOpacity(0.8),
                    offset:const Offset(-6, -6), // changes position of shadow
                  
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset:const Offset(6, 6), // changes position of shadow
                  ),]
                ),
                ),
            ),
      
            //third biggest object
             Transform.rotate(
              angle: _rotationAnimation.value + 0.4 ,
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                 borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  // shape: BoxShape.circle,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF692D94).withOpacity(0.8),
                    offset:const Offset(-6, -6), // changes position of shadow
                  
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset:const Offset(6, 6), // changes position of shadow
                  ),]
                ),
                ),
            ),


            //4th biggest object
             Transform.rotate(
              angle: _rotationAnimation.value + 0.6 ,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  // shape: BoxShape.circle,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF692D94).withOpacity(0.8),
                    offset:const Offset(-6, -6), // changes position of shadow
                  
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset:const Offset(6, 6), // changes position of shadow
                  ),]
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
