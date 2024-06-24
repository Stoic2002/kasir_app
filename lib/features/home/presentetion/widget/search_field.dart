import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';

class SearchField extends StatefulWidget {
  final String? hint;
  final String? initialValue;
  final bool enabled;
  final TextEditingController? controller;
  final double height;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const SearchField({
    Key? key,
    this.hint = 'Search',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.enabled = true,
    this.height = 48.0,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      height: widget.height,
      child: TextField(
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: AppColors.halfPurple,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: AppColors.halfPurple,
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
      ),
    );
  }
}
