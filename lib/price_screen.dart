import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  PriceScreen({
    this.key,
    this.superPrizeNo = '91911374',
    this.spcPrizeNo = '08501338',
    this.firstPrizeNo2 = '23570653',
    this.firstPrizeNo1 = '57161318',
    this.firstPrizeNo3 = '47332279',
    this.sixthPrizeNo1 = '519',
    this.ym = '109年 03 ~ 04 月',
  }) : super(key: key);
  final Key key;
  final superPrizeNo;
  final spcPrizeNo;
  final firstPrizeNo1;
  final firstPrizeNo2;
  final firstPrizeNo3;
  final sixthPrizeNo1;
  final ym;
  final _discSuperPrize = '8位相同1,000萬元';
  final _discSpcPrizeNo = '8位相同200萬元';
  final _discFirstPrizeNo1 = '8位相同20萬元\n'
      '末7位相同4萬元\n'
      '末6位相同1萬元\n'
      '末5位相同4千元\n'
      '末4位相同1千元\n'
      '末3位相同2百元';
  final _discSixthPrizeNo1 = '3位相同2百元';

  final _priceNoTextStyle = TextStyle(color: Colors.red, fontSize: 23);
  final _last3NoTextStyle = TextStyle(
      color: Colors.red.shade900, fontSize: 23, fontWeight: FontWeight.w900);
  List<Widget> genFirstPriceRichTexts(List<String> numbers) {
    var result = <Widget>[];
    for (var num in numbers) {
      result.add(
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: num.substring(0, 5),
              style: _priceNoTextStyle,
              children: [
                TextSpan(
                    text: num.substring(5, num.length),
                    style: _last3NoTextStyle),
              ]),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(ym),
        Container(
          padding: EdgeInsets.all(20),
          child: Table(
            border: TableBorder.all(width: 2),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FractionColumnWidth(0.2),
              1: FractionColumnWidth(0.4),
              2: FractionColumnWidth(0.4),
            },
            children: [
              TableRow(
                children: [
                  Text(
                    '特別獎',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        superPrizeNo,
                        textAlign: TextAlign.center,
                        style: _priceNoTextStyle,
                      ),
                    ),
                  ),
                  Text(
                    _discSuperPrize,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '特獎',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        spcPrizeNo,
                        textAlign: TextAlign.center,
                        style: _priceNoTextStyle,
                      ),
                    ),
                  ),
                  Text(
                    _discSpcPrizeNo,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '頭獎',
                    textAlign: TextAlign.center,
                  ),
                  Column(
                      children: genFirstPriceRichTexts(
                          [firstPrizeNo1, firstPrizeNo2, firstPrizeNo3])),
                  Text(
                    _discFirstPrizeNo1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '增開六獎',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    sixthPrizeNo1,
                    textAlign: TextAlign.center,
                    style: _last3NoTextStyle,
                  ),
                  Text(
                    _discSixthPrizeNo1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
