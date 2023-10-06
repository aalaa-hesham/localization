// import 'package:defapp/secondfile.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'langmen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'language '),
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

  var user = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageHomeListTitle),
      ), //widget.title +
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              S.of(context).pageHomeSampleCurrentDateTime(
                  DateTime.now(), DateTime.now()),
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 80,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: user,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: '  Username',
                ),
              ),
            ),
// spacer
            const SizedBox(height: 12.0),
// [Password]
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),

            OverflowBar(
              overflowDirection: VerticalDirection.down,
              alignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    user.clear();
                    password.clear();

                  },
                ),

                ElevatedButton(
                  child: Mytext(
                    label: "Next",
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mysecondscreen(
                            data: "Welcome ${user.text}",
                            passdata: password.text,
                          ),
                        ));


                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                S.load(const Locale('en'));
                              });
                            },
                            child: const Text('ENGLISH'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                S.load(const Locale('fr'));
                              });
                            },
                            child: const Text('francais'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                S.load(const Locale('ar'));
                              });
                            },
                            child: const Text('العربية'),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 70,
                ),
                Langmenu(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Mytext extends StatelessWidget {
  var label;

  Mytext({this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Text("$label");
  }
}
