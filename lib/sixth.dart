import 'package:flutter/material.dart';

class SixthRoute extends StatefulWidget {
  @override
  _SixthRouteState createState() => _SixthRouteState();
}

class _SixthRouteState extends State<SixthRoute> {
  int count = 0;

  void decrement() {
    setState((){ //a cada vez que eu clico a minha tela vai ser refeita
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //parte de cima
        title: Text('Parasitos na Flora e Fauna', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.limeAccent,

        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(45),
            )
        ),
      ),

      //drawer: Drawer(), // MENU LATERAL(flexbox)
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagens/fotofundo.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //alinhamento do eixo principal,
            children: [
              const Text(
                'CONTADOR!',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.brown,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(80),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 90,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)
                        )
                    ),
                    child: const Text(
                      '-1',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 90),
                  TextButton(
                    onPressed: increment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)
                      ),
                    ),
                    child: const Text(
                      '+1',
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ),
                ],
              ), // é horizontal, enquanto a coluna é vertical
            ],
          )
      ),
    );
  }
}
