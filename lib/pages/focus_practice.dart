import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';

class FocusPractice extends StatefulWidget {
  const FocusPractice({super.key});

  @override
  State<FocusPractice> createState() => _FocusPracticeState();
}

class _FocusPracticeState extends State<FocusPractice> {
  FocusNode firstFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FocusPractice'),
      ),
      drawer: const CommonDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
            ),
          ),
          DropdownButton(
            focusNode: firstFocusNode,
            items: const [
              DropdownMenuItem(
                child: Text('aaa'),
                value: 'aaa',
              ),
              DropdownMenuItem(
                child: Text('bbb'),
                value: 'bbb',
              ),
              DropdownMenuItem(
                child: Text('ccc'),
                value: 'ccc',
              ),
            ],
            onChanged: (String? value) {},
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
}
