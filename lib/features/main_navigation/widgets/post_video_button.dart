import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    super.key,
    required this.onTap,
    required this.inverted,
  });

  final Function onTap;
  final bool inverted;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool _isTap = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isTap = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isTap = false;
      widget.onTap();
    });
  }

  void _onTapCancel() {
    setState(() {
      _isTap = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        opacity: _isTap ? 0.6 : 1.0,
        duration: Duration(milliseconds: 100),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 20,
              child: Container(
                height: 30,
                width: 25,
                padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
                decoration: BoxDecoration(
                  color: Color(0xff61D4F0),
                  borderRadius: BorderRadius.circular(Sizes.size8),
                ),
              ),
            ),
            Positioned(
              left: 20,
              child: Container(
                height: 30,
                width: 25,
                padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Sizes.size8),
                ),
              ),
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
              decoration: BoxDecoration(
                color: widget.inverted ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: widget.inverted ? Colors.white : Colors.black,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
