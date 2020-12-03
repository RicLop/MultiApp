import 'package:flutter/material.dart';
import 'Styles.dart';

Widget textField(
    {@required IconData icon,
    @required String hintText,
    bool obscureText = false,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
    String autoFill = "",
    TextEditingController controller,
    Function onChange}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 10.0),
      Container(        
        height: 80.0,        
        child: TextFormField(
          validator: (value) {
            if (isRequired && value.isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          },
          onChanged: (value) => onChange(value),
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.zero,
            fillColor: Colors.white,
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(                  
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(                
                color: Colors.red,
              ),
            ),
            errorStyle: TextStyle( 
              height: 1,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
            
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(                
                color: Color.fromRGBO(240, 133, 33, 1)
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(7, 77, 102, 1)
              ),
            ),
            helperText: ' ',
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: hintTextStyle,
          ),
          autofillHints: [autoFill]
        )      
      )
    ],
  );
}
