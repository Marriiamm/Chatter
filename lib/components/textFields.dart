import 'package:chatter/consts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customtextFormField extends StatelessWidget {
   customtextFormField({this.hintText,this.labelText, this.onChange, this.obscureTtext = false });

  String? hintText;
  String? labelText;
  bool?  obscureTtext ;
  Function (String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                obscureText: obscureTtext!,
                validator: (data){
                  if(data!.isEmpty){
                    return 'field is required!';
                  }
                },
                onChanged: onChange,
                style: const TextStyle(color:kPrimaryColor,),
                decoration: InputDecoration(
                  fillColor: klightclr,
                  filled: true,
                  errorStyle: TextStyle(color: klightclr),
                  //labelText: labelText,
                  //labelStyle: const TextStyle(color:Colors.black,fontFamily: 'Exo2',),
                  hintText: hintText,
                  hintStyle: const TextStyle(color:kPrimaryColor,fontFamily: 'Exo2',),
                  border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:  const BorderSide(
                  color:kPrimaryColor,
                  width: 2.0,
                ),
            ) ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:  const BorderSide(
                color:kPrimaryColor,
                width: 2.0,
                ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:  const BorderSide(
                color:kPrimaryColor,
                width: 4.0,
                ),
            )
          ),
        );
  }
}