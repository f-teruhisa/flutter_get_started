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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ①変数の定義
  int _counter = 0;
  // String _type = "偶数";

  // 5. カウンタが押されたときのメソッド
  void _incrementCounter() {
    // ④setStateの中で変数を更新する
    setState(() {
      _counter++;
      // if (_counter % 2 == 0) {
      //   _type = "偶数";
      // } else {
      //   _type = "奇数";
      // }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // テキストの下に表示されるカウンタ値
            // ②変数の表示
            // ⑤変数の更新
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_counter % 2 == 0)
              const Text('偶数です',
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            // Text(
            //   '$_type',
            //   style: TextStyle(fontSize: 20, color: Colors.red),
            // ),
          ],
        ),
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        // ③ボタンをタップするとメソッドが呼ばれる
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
