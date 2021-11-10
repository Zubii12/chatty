import 'package:chatty/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: SizedBox(
        height: 32.0,
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(height: 0.7),
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.darkBlack,
            prefixIcon: const Icon(
              Icons.search,
              size: 18.0,
              color: Palette.disabledGrey,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.darkBlack),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.darkBlack),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.darkBlack),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
