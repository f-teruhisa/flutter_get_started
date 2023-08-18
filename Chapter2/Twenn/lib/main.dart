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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  late Animation<Color?> _animationColor;
  final ColorTween _tweenColor =
      ColorTween(begin: Colors.green, end: Colors.blue);

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  // 停止
  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  // 逆再生
  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  // 生成
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // TweenとAnimationControllerからAnimationを作る（サイズ）
    _animationDouble = _tweenDouble.animate(_animationController);
    _animationDouble.addListener(() {
      setState(() {});
    });

    // TweenとAnimationControllerからAnimationを作る（色）
    _animationColor = _tweenColor.animate(_animationController);
    _animationColor.addListener(() {
      setState(() {});
    });
  }

  // 破棄
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            Text("AnimationController: ${_animationController.value}"),
            Text("AnimationDouble: ${_animationDouble.value}"),
            Text("AnimationColor: ${_animationColor.value}"),
            SizeTransition(
                sizeFactor: _animationController,
                child: Center(
                    child: SizedBox(
                        width: _animationDouble.value,
                        height: _animationDouble.value,
                        child: Container(
                          color: _animationColor.value,
                        ))))
          ],
        ),
      ),
      // 再生・停止・逆再生のボタン
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: _forward, child: const Icon(Icons.arrow_forward)),
          FloatingActionButton(
              onPressed: _stop, child: const Icon(Icons.pause)),
          FloatingActionButton(
              onPressed: _reverse, child: const Icon(Icons.arrow_back)),
        ],
      ),
    );
  }
}
