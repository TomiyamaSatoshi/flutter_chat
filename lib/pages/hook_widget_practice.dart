import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookWidgetPractice extends HookWidget {
  const HookWidgetPractice({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    // 画面開かれた時
    useEffect(() {
      debugPrint('画面が開かれました');
      return null;
    }, const []);

    // 画面が消えた時
    useEffect(() {
      return () {
        debugPrint('画面が閉じられました');
      };
    }, const []);

    // countが変更した時
    useEffect(() {
      debugPrint('countが変更されました');
      return null;
    }, [count.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HookWidgetPractice'),
      ),
      drawer: const CommonDrawer(),
      body: Center(
        child: Text(
          '${count.value}',
          style: const TextStyle(fontSize: 64),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value = count.value + 1;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
