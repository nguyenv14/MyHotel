import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel/configs/extensions.dart';

class InputFieldComponent extends StatefulWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController textEditingController;
  final Color color;
  // final Widget widgetPass;
  final bool isPassword;

  const InputFieldComponent(
      {super.key,
      required this.iconData,
      required this.hintText,
      required this.textEditingController,
      required this.color,
      this.isPassword = false});
//
  // TextEditingController get controller => textEditingController;

  @override
  State<InputFieldComponent> createState() => _InputFieldComponentState();
}

class _InputFieldComponentState extends State<InputFieldComponent> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  bool password = false;
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
    if (widget.isPassword) {
      setState(() {
        password = true;
      });
    }
    return Container(
      alignment: Alignment.center,
      width: context.mediaQueryWidth * 0.9,
      decoration: BoxDecoration(
          border: _isFocused ? Border.all(width: 2, color: widget.color) : null,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 7, offset: Offset(1, 0))
          ],
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        obscureText: password,
        controller: widget.textEditingController,
        focusNode: _focusNode,
        decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            focusColor: widget.color,
            suffixIcon: widget.isPassword
                ? InkWell(
                    child: const Icon(FontAwesomeIcons.eye),
                    onTap: () {
                      setState(() {
                        setState(() {
                          password = !password;
                        });
                        // widget.isPassword = !widget.isPassword;
                      });
                    },
                  )
                : null,
            icon: Icon(
              widget.iconData,
              color: _isFocused ? widget.color : Colors.grey,
            )),
      ),
    );
  }
}
