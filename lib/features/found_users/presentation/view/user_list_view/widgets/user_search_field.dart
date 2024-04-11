import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class UserSearchField extends StatelessWidget {
  final _controller = TextEditingController();

  UserSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 15),
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
