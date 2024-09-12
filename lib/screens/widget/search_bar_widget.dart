import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {

    var border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );

    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search with product name',
        border: border,
        enabledBorder: border,
        fillColor: Colors.grey[200],
        filled: true,
        enabled: true,
      ),
    );
  }
}
