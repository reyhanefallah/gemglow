import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/curved.dart';

//ELEVATEDBUTTON
class GElevatedButton extends StatelessWidget {
  const GElevatedButton({
    super.key,
    required this.Gcolor,
    required this.Gtitle,
    required this.Gstyle,
    this.Gicon,
    this.GborderSide,
    this.Gelevation = 0,
    required this.GonPressed,
  });
  final Color Gcolor;
  final String Gtitle;
  final TextStyle Gstyle;
  final Widget? Gicon;
  final BorderSide? GborderSide;
  final double Gelevation;
  final VoidCallback GonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: Gelevation,
            backgroundColor: Gcolor,
            fixedSize: Size.fromHeight(60),
            side: GborderSide,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: GonPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Gtitle,
                style: Gstyle,
              ),
              if (Gicon != null) ...[
                Gicon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

//TEXTFIELD
class GFormField extends StatelessWidget {
  const GFormField({
    super.key,
    required this.Gstyle,
    required this.Ghint,
    this.Gicon,
  });
  final String Ghint;
  final TextStyle Gstyle;
  final Icon? Gicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: Ghint,
            suffixIcon: Gicon,
          ),
        ),
      ),
    );
  }
}

//CIRCLEDESIGN
class HomeDesign extends StatelessWidget {
  const HomeDesign({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0.0,
    this.child,
    this.backgroundColor = Colors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}

//HOMEPAGE
class CurveHome extends StatelessWidget {
  const CurveHome({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GCurved(),
      child: child,
    );
  }
}

//HEADERMAIN
class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurveHome(
      child: Container(
        color: GColor.primaryColor1,
        padding: EdgeInsets.all(0.0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: HomeDesign(
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: HomeDesign(
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: -150,
                left: -300,
                child: HomeDesign(
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
