import 'package:flutter/material.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../../style/style_scheme.dart';

class CustomSearchbar extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const CustomSearchbar({
    super.key, 
    required this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return SearchBar(
      leading: Icon(
        Icons.search,
        color: mtheme.colorScheme.onSurfaceVariant.withOpacity(0.5),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      hintText: hintText??'Search',
      hintStyle: WidgetStatePropertyAll<TextStyle>(
        mtheme.textTheme.titleMedium!.copyWith(
          color: mtheme.colorScheme.onSurfaceVariant.withOpacity(0.5),
          fontFamily: StyleScheme.engFontFamily,
          letterSpacing: -0.5,
        ),
      ),
      elevation: const WidgetStatePropertyAll<double>(0),
      backgroundColor: WidgetStatePropertyAll<Color>(mtheme.colorScheme.onSurfaceVariant.withOpacity(0.1),),
      shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}