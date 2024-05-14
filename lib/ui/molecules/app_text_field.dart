import 'package:flutter/material.dart';

class ApptextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final bool? isEnabled;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  const ApptextField({
    super.key,
    required this.onChanged,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 45,
        width: MediaQuery.sizeOf(context).width,
        child: TextFormField(
          onTap: onTap,
          validator: (String? value) {
            if (value != null) {
              return null;
            } else {
              return 'Este campo es obligatorio';
            }
          },
          controller: controller,
          onChanged: onChanged,
          enabled: isEnabled,
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink[100]!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
