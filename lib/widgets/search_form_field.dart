import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/bloc/search/search_cubit.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;

  const SearchFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // onChanged: (value) async {},
      onFieldSubmitted: (value) {
        if (value.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: Text(
                'Please enter search text',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          context.read<SearchCubit>().getSearchAll(controller.text);
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        isDense: true,
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xffCCCCCC),
          size: 20,
        ),
        filled: true,
        // fillColor: Pallete.accent3,
        // focusColor: Pallete.accent3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
