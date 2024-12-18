import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//メイン部分
//基本的にここで定義してその下にアイテムを加えていく
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      //アプリ全体の名前。Andoridのシュミレータでは見えないタイトル
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        //SingleChildScrollView　：スクロールできる表示領域的な感じ
        body: const SingleChildScrollView(
          //Column 子ウィジェットを縦方向に並べます。
          //Columnの中に配置されたウィジェットは、上から下へと順番に表示される
          child: Column(
            children: [
              ImageSection(
                image: 'images/lake.jpg'
                ),
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
                ),
              ButtonSection(),
              TextSection(
                description:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                'Bernese Alps. Situated 1,578 meters above sea level, it '
               'is one of the larger Alpine Lakes. A gondola ride from '
               'Kandersteg, followed by a half-hour walk through pastures '
               'and pine forest, leads you to the lake, which warms to 20 '
               'degrees Celsius in the summer. Activities enjoyed here '
               'include rowing, and riding the summer toboggan run.',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//タイトルセクション作成部分
//StatelessWidgetは、状態を持たないウィジェット.静的UI
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

//Padding以降をメインクラスに書くことができる
//StatelessWidgetで切り出すことでメインを軽くする（コードを見やすくしている、ネストを深くしない）
//切り出し方は人それぞれの好み
  @override
  Widget build(BuildContext context) {
    return Padding(
       //下のものを横並び（raw）にしたいという指示で、上下左右32の余白
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
                    //nameで指定したテキストのスタイル指定
                    name,
                    //const は描画のパフォーマンスが上がる
                    //不確定要素（外からとってきた）ものがあるとつけれない
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
          const Text(
            '41',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

//ボタンセクションの作り込み
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

//テキストセクションの作り込み
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
         //softWrapはいい感じに改行してくれる
        softWrap: true,
      ),
    );
  }
}

//画像セクションの作り込み
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}