import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class PasswordInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const PasswordInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        style: putihTextStyle,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          fillColor: kinputColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultradius),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: abuTextStyle,
          suffixIcon: Icon(
            Icons.visibility,
            color: kabuColor,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.Dart';

// class PasswordField extends StatefulWidget {
//   const PasswordField({
//     this.fieldKey,
//     this.hintText,
//     this.labelText,
//     this.helperText,
//     this.onSaved,
//     this.validator,
//     this.onFieldSubmitted,
//   });

//   final Key fieldKey;
//   final String hintText;
//   final String labelText;
//   final String helperText;
//   final FormFieldSetter<String> onSaved;
//   final FormFieldValidator<String> validator;
//   final ValueChanged<String> onFieldSubmitted;

//   @override
//   _PasswordFieldState createState() => new _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return new TextFormField(
//       key: widget.fieldKey,
//       obscureText: _obscureText,
//       maxLength: 8,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       decoration: new InputDecoration(
//         border: const UnderlineInputBorder(),
//         filled: true,
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         helperText: widget.helperText,
//         suffixIcon: new GestureDetector(
//           onTap: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           child:
//           new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
//         ),
//       ),
//     );
//   }
// }

//  import 'package:my_app/password.Dart';

//   String _password;
//   final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

//   PasswordField(
//     fieldKey: _passwordFieldKey,
//     helperText: 'No more than 8 characters.',
//     labelText: 'Password *',
//     onFieldSubmitted: (String value) {
//       setState(() {
//         this._password = value;
//       });
//      },
//   ),
