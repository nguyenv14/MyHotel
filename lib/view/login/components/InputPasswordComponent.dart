import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel/configs/extensions.dart';

class InputPasswordComponent extends StatefulWidget {
  const InputPasswordComponent({super.key});

  @override
  State<InputPasswordComponent> createState() => _InputPasswordComponentState();
}

class _InputPasswordComponentState extends State<InputPasswordComponent> {
  bool _isFocused = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.mediaQueryWidth * 0.9,
      decoration: BoxDecoration(
          // border: _isFocused ? Border.all(width: 2, color: widget.color) : null,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 7, offset: Offset(1, 0))
          ],
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        // controller: widget.textEditingController,
        focusNode: _focusNode,
        decoration: InputDecoration(
            hintText: "Enter the password",
            border: InputBorder.none,
            // focusColor: widget.color,
            icon: Icon(
              FontAwesomeIcons.lock,
              // color: _isFocused ? widget.color : Colors.grey,
            )),
      ),
    );
  }
}
