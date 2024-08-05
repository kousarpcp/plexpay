import 'package:flutter/cupertino.dart';

dynamic  height;
dynamic  width;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({super.key,

    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold
  });

  @override
  Widget build(BuildContext context) {

    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return LayoutBuilder(
        builder:  (context, constraints) {
          if(constraints.maxWidth<500){
            return mobileScaffold;
          }else if(constraints.maxWidth<1100){
            return tabletScaffold;
          }else{
            return desktopScaffold;
          }
        },
    );
  }
}
