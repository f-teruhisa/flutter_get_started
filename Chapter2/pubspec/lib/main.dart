import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int _counter = 0;

  // 5. カウンタが押されたときのメソッド
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("HelloWorld");
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MyHomePageの画面を構築する部分
    return Scaffold(
      appBar: AppBar(
        // 画面上部のタイトル部分
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Icon(FontAwesomeIcons.gift, color: Colors.teal),
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
