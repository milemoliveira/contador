import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  void decrement() {
    setState(() {
      count --;
    });
  }

  void increment() {
    setState(() {
      count ++;
    });
  }

  void zerar() {
    setState(() {
      count = 0;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null, backgroundColor: const Color(0XFF141926),),
      backgroundColor: const Color(0XFF1C2130),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: isFull? const Color(0X77D14334) : const Color(0X77B3E099),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isFull ? 'Lotado!' : 'Disponível!',
                    style: const TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 25,
                    ),),
                ],
              ),
            ),
          ),
        const Text('TOTAL DE PESSOAS',
          style: TextStyle(
            fontSize: 30,
            color: Color(0XFFFFEAAD)
          ),),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 100,
              color: Color(0XFFFFEAAD),
            ),

          ),
        ),
        const Text(
          'Capacidade máxima: 25 pessoas',
          style: TextStyle(
            color: Color(0X50FFFFFF),
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? const Color(0X20028F76)  : const Color(0XFF028F76),
                    fixedSize: const Size(120, 120),
                    primary: const Color(0XFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: isFull ? null : increment, 
                  child: const Text('ENTRADA',
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),),),
                const SizedBox(width: 70,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:  isEmpty ? const Color(0X20D14334) : const Color(0XFFD14334), 
                    fixedSize: const Size(120, 120),
                    primary: const Color(0XFFb3a394),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: isEmpty ? null : decrement, 
                  child: const Text('SAÍDA',
                  style: TextStyle(color: Color(0XFFFFFFFF),
                  fontSize: 20)))],
            ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0XFF474D61),
            fixedSize: const Size(160, 40), 
          ),
          onPressed: zerar, 
          child: const Text('Zerar contador', 
            style: TextStyle(color: Color(0XFFFFFFFF),
              fontSize: 18),))
        ],
      ),
    );
  }
}
