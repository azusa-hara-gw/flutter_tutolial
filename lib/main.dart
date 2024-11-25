import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        //SingleChildScrollView　スクロールできる
        body: const SingleChildScrollView(
          //Column 子ウィジェットを縦方向に並べます。Columnの中に配置されたウィジェットは、上から下へと順番に表示される
          child: Column(
            children: [
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
            )
          ],
        ),
      ),
      ),
    );
  }
}
//StatelessWidgetは、状態を持たないウィジェット
//一度構築されたら、その後のウィジェットの状態の変化に応じて再構築されることはありません。静的UI
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              //CrossAxisAlignment Row や Column などのレイアウトウィジェットの
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                //Padding　余白　太文字のテキストの下に８ポイントの余白を作る
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}