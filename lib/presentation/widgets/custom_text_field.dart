import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final Function(bool)? onTogglePasswordVisibility;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.onTogglePasswordVisibility, required TextEditingController controller, required Null Function(dynamic value) onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width >= 600 ? 300 : 200,
        child: TextField(
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(widget.prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                      widget.onTogglePasswordVisibility?.call(_isPasswordVisible);
                    },
                  )
                : null,
          ),
          obscureText: widget.obscureText && !_isPasswordVisible,
        ),
      ),
    );
  }
}
