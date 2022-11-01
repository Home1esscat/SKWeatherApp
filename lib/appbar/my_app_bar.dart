import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Start typing to search...',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 44,
                height: 44,
                child: RawMaterialButton(
                  elevation: 0,
                  onPressed: () => _controller.clear(),
                  fillColor: Colors.blue,
                  shape: const CircleBorder(),
                  child: const Icon(
                    color: Colors.white,
                    Icons.search_rounded,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
