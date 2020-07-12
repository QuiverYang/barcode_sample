import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'price_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myBarcodeData = '/0RNRRQ';
  Widget priceScreen = PriceScreen();
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return Row(
                      children: [
                        Icon(Icons.chevron_left),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width -
                                  48, //因為icon 預設大小24
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.4),
                          child: PageView(
                            controller: controller,
                            children: [
                              PriceScreen(),
                              PriceScreen(ym: '01-02'),
                              PriceScreen(ym: '11-12'),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    );
                  }
                }),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.code),
                hintText: '請輸入您的手機條碼',
                labelText: '英文大小寫有區分喔',
              ),
              onChanged: (value) {
                myBarcodeData = value;
                setState(() {});
              },
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: BarcodeWidget(
                barcode: Barcode.code39(), // Barcode type and settings
                data: myBarcodeData, // Content
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 100,
                errorBuilder: (context, something) => Text('輸入的資料有誤'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
