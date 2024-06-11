import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String? hint;
  final String? initialValue;
  final bool enabled;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final double height;

  const SearchField({
    Key? key,
    this.hint = 'Search',
    this.initialValue,
    this.enabled = true,
    required this.onChanged,
    this.onSubmitted,
    this.height = 48.0,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      height: widget.height,
      child: TextField(
        enabled: widget.enabled,
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: Colors.grey[300],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey[900],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: widget.height / 4),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
