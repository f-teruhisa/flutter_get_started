import 'package:flutter/material.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. タイトルとテーマを設定する。画面の本体はMyHomePageで作る。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Satefulを継承したクラス
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // Stateを継承したクラス
  // MyHomePageの中でどんな状態を持つかと言う部分に、_MyHomePageStateが利用されている
  // ロジックや実態の保持の仕方は_MyHomePageState側で実装する
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _flag = false;

  // 5. カウンタが押されたときのメソッド
  void _click() {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MyHomePageの画面を構築する部分
    return Scaffold(
      appBar: AppBar(
        // 画面上部のタイトル部分
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
                duration: const Duration(seconds: 3),
                width: _flag ? 100 : 50,
                height: _flag ? 50 : 100,
                padding:
                    _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
                margin:
                    _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
                transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
                color: _flag ? Colors.blue : Colors.grey),
            AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                child: _flag
                    ? const Text("何もない")
                    : const Icon(Icons.favorite, color: Colors.pink))
          ],
        ),
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add),
      ),
    );
  }
}
