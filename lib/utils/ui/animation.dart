import 'package:flutter/material.dart';

//Bu animasyon widgeti kendi controlleri ile sadece init state durumunda çalışmak için kullanılır.
class SetMyAnimate extends StatefulWidget {
  const SetMyAnimate({
    super.key,
    required this.child,
    required this.startX,
    required this.startY,
    required this.duration,
  });
  final Widget child; 
  final double startX;
  final double startY;
  final int duration;

  @override
  State<SetMyAnimate> createState() => _SetMyAnimateState();
}

class _SetMyAnimateState extends State<SetMyAnimate>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation1;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    animation1 = Tween<Offset>(
      begin: Offset(widget.startX, widget.startY),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut));

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: animation1, child: widget.child);
  }
}

//Bu animasyon widgeti içinde bulunduğu widgetin controlleri ile çalışır.
class SetMyAnimation extends StatelessWidget {
  final AnimationController animationController;
  final Widget child;
  final double startX;
  final double startY;

  const SetMyAnimation({
    super.key,
    required this.animationController,
    required this.child,
    required this.startX,
    required this.startY,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(startX, startY),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: animationController, curve: Curves.linearToEaseOut)),
      child: child,
    );
  }
}

//Bu animasyon widgeti kendi controlleri ile sadece init state durumunda çalışmak için kullanılır.
class SetMyAnimateFade extends StatefulWidget {
  const SetMyAnimateFade({
    super.key,
    required this.child,
    this.startX=0,
    this.startY=0,
    required this.duration,
  });
  final Widget child;
  final double startX;
  final double startY;
  final int duration;

  @override
  State<SetMyAnimateFade> createState() => _SetMyAnimateFadeState();
}

class _SetMyAnimateFadeState extends State<SetMyAnimateFade>
    with TickerProviderStateMixin {
  late AnimationController controller0;
  late AnimationController controller1;
  late Animation<Offset> animation0;
  late Animation<double> animation1;

  @override
  void initState() {
    controller0 = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    animation0 = Tween<Offset>(
      begin: Offset(widget.startX, widget.startY),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: controller0, curve: Curves.linearToEaseOut));

    //
    controller1 = AnimationController(
        duration: Duration(milliseconds: widget.duration*2), vsync: this);
    
    animation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: controller1, curve: Curves.easeIn));

    controller0.forward();
    controller1.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller0.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation0,
      child: FadeTransition(
        opacity: animation1,child: widget.child,),
    );
  }
}
