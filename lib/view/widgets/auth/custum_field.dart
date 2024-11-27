import 'package:flutter/material.dart';

class CustumTextField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData? icon;
  final TextInputType type;
  final TextEditingController control;
  final bool? ispassword;
  final String? Function(String?)? valid;
  final void Function()? onPasswordTap;

  const CustumTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.type,
    required this.control,
    this.ispassword,
    this.valid,
    this.onPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: ispassword == null ? false : ispassword!,
      validator: valid,
      controller: control,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        label: Text(' $label '),
        labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InkWell(
          onTap: onPasswordTap,
          child: Icon(icon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
