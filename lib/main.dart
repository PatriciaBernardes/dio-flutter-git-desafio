import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipalPage(),
    );
  }
}

class PrincipalPage extends StatefulWidget {
  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  TextEditingController txtnumber = TextEditingController();

  void enviar() {
    String number;

    setState(() {
      number = txtnumber.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage(number)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 30),
              controller: txtnumber,
              decoration: const InputDecoration(
                labelText: 'Capacidade máxima',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: enviar,
              child: const Text(
                'Enviar',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  String number;

  HomePage(this.number);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    //print('$count');
  }

  void increment() {
    setState(() {
      count++;
    });
    //print('$count');
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == int.parse(widget.number);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode Entrar!',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    fixedSize: const Size(100, 100),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text('Saiu'),
                ),
                const SizedBox(width: 40),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    fixedSize: const Size(100, 100),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: isFull ? null : increment,
                  child: const Text('Entrou'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
