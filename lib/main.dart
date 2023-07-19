import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

////////////////////////////////////////////////////////////////////////////////
// outras classes/páginas
import 'fifth.dart';
import 'sixth.dart';
import 'seventh.dart';
import 'eight.dart';
import 'nineth.dart';

class CategoryModel {
  final String name;
  final String imageAsset;

  CategoryModel({
    required this.name,
    required this.imageAsset,
  });

  @override
  List<Object?> get props => [name, imageAsset];

  static List<CategoryModel> categories = [
    CategoryModel(
      name: 'Html | Css',
      imageAsset: 'assets/imagens/img1.jpeg',
    ),
    CategoryModel(
      name: 'Html | Css',
      imageAsset: 'assets/imagens/img2.jpeg',
    ),
    CategoryModel(
      name: 'Python | Kivy',
      imageAsset: 'assets/imagens/img3.jpeg',
    ),
    CategoryModel(
      name: 'Godot Engine',
      imageAsset: 'assets/imagens/img4.jpeg',
    ),
  ];
}
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lobsterTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeRoute(),
        '/second': (context) => SecondRoute(),
        '/third': (context) => ThirdRoute(),
        '/fourth': (context) => FourthRoute(),
        '/fifth': (context) => FifthRoute(),
        '/sixth': (context) => SixthRoute(),
        '/seventh': (context) => SeventhRoute(),
        '/eight': (context) => EightRoute(),
        '/nineht': (context) => NinethRoute(),
      },
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
//PRIMEIRA PÁGINA//
class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  bool isCardVisible = false;

  void toggleCardVisibility() {
    setState(() {
      isCardVisible = !isCardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'APLICATIVO DA LETICIA ❤️!',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        titleSpacing: 00.0,
        toolbarHeight: 60.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        elevation: 0.00,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.pinkAccent[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Olá mundo!',
                      speed: Duration(milliseconds: 200),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    TyperAnimatedText(
                      'Bem vindo 🏴‍☠️',
                      speed: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 130.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/01.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/02.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/00.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Cor de fundo do botão
                    // Outras propriedades de estilo do botão, se necessário
                  ),
                  child: Text('Sobre'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Cor de fundo do botão
                    // Outras propriedades de estilo do botão, se necessário
                  ),
                  child: Text('Contato'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                    child: Text ('Projetos'),
                    onPressed: (){
                  Navigator.pushNamed(context, '/fourth');
                }
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isCardVisible
                    ? Colors.green
                    : Colors
                        .green, // Cor de fundo do botão com base na variável isCardVisible
                // Outras propriedades de estilo do botão, se necessário
              ),
              child: Text(isCardVisible ? 'Ocultar' : 'Desenvolvedora'),
              onPressed: toggleCardVisibility,
            ),
            AnimatedOpacity(
              opacity: isCardVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: FlutterSlimyCard(
                topCardHeight: 200,
                bottomCardHeight: 80,
                cardWidth: 200,
                topCardWidget: topCardWidget(),
                bottomCardWidget: bottomCardWidget(),
                color: Colors.tealAccent,
              ),
            ),
            Text(
              'Portifólio:',
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.green,
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: CategoryModel.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final CategoryModel category;

  const HeroCarouselCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              category.imageAsset,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget topCardWidget() {
  return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        'assets/imagens/03.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget bottomCardWidget() {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
    ),
    child: Stack(
      children: [
        Positioned(
          child: Container(
            padding: EdgeInsets.all(10),
            child: const Text(
              'Desenvolvedora em Progresso',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
////////////////////////////////////////////////////////////////////////////////
//SEGUNDA PÁGINA//
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          "CURRÍCULO",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Graduação',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Análise e Desenvolvimento de Sistemas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'UniAmerica',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '2023 — 2025',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Bacharelado em Medicina Veterinária',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Pontifícia Universidade Católica do Paraná ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '2015 — 2019',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.greenAccent,
                    child: Lottie.asset(
                      'assets/books.json',
                      width: 70,
                      height: 110,
                      fit: BoxFit.fill,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.greenAccent,
                    child: Lottie.asset(
                      'assets/tucano.json',
                      width: 202,
                      height: 202,
                      fit: BoxFit.fill,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Especialização',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pós Graduação em Medicina Veterinária de Animais Selvagens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Unyleya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '(Abril 2022 — Dezembro 2022)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pós Graduação em Vigilância Sanitária e Controle de Qualidade dos Alimentos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Qualittas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '(Janeiro 2020 — Dezembro 2020) ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Interesses',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Css | Python | Java |',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Godot engine |',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Flutter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Linguagens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Inglês',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Italiano',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.greenAccent,
                    child: Lottie.asset(
                      'assets/livrosefolhas.json',
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
//PÁGINA TRES//
class ThirdRoute extends StatelessWidget {
  final String linkedinUrl =
      'https://www.linkedin.com/in/leticia-heloisa-bini-haiduk-66305b156/';
  final String githubUrl = 'https://github.com/LeticiaBHB';
  final String email = 'leticia.bini@gmail.com';
  final String phoneNumber = '+5541995919470';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text("CONTATO"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Container(
              width: 350,
              height: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.greenAccent[100]),
              child: Text(
                'Para obter mais informações, sinta-se à vontade para entrar em contato. Terei o maior prazer em responder às suas perguntas.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _launchURL(linkedinUrl),
                          child: Text(
                            'LinkedIn',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => _launchURL(githubUrl),
                          child: Text(
                            'GitHub',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => _launchEmail(email),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => _saveContact(phoneNumber),
                          child: Text(
                            'Telefone',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Lottie.asset(
              'assets/msgcel.json',
              width: 302,
              height: 202,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      throw 'Não foi possível abrir o link $url';
    }
  }

  _launchEmail(String emailAddress) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    final String emailLaunchUriString = _emailLaunchUri.toString();
    try {
      await launch(emailLaunchUriString);
    } catch (e) {
      throw 'Não foi possível abrir o link de e-mail $emailAddress';
    }
  }

  _saveContact(String phoneNumber) async {
    final Uri _contactLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    final String contactLaunchUriString = _contactLaunchUri.toString();
    if (await canLaunch(contactLaunchUriString)) {
      await launch(contactLaunchUriString);
    } else {
      throw 'Não foi possível salvar o contato $phoneNumber';
    }
  }
}
////////////////////////////////////////////////////////////////////////////////
//PÁGINA QUATRO//
class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          "PROJETOS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: Container(
        width: 110,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Lottie.asset(
                          'assets/home.json', // Substitua pelo caminho do seu arquivo JSON
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.green, // Cor de fundo da bolinha
                  radius: 20, // Raio da bolinha
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white, // Cor do ícone
                    onPressed: () {
                      Navigator.pushNamed(context, '/fifth');
                    },
                  ),
                ),
              ),
              ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.green, // Cor de fundo da bolinha
                  radius: 20, // Raio da bolinha
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white, // Cor do ícone
                    onPressed: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                  ),
                ),
              ),
              ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.green, // Cor de fundo da bolinha
                  radius: 20, // Raio da bolinha
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white, // Cor do ícone
                    onPressed: () {
                      Navigator.pushNamed(context, '/seventh');
                    },
                  ),
                ),
              ),
              ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.green, // Cor de fundo da bolinha
                  radius: 20, // Raio da bolinha
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white, // Cor do ícone
                    onPressed: () {
                      Navigator.pushNamed(context, '/eight');
                    },
                  ),
                ),
              ),
              ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.green, // Cor de fundo da bolinha
                  radius: 20, // Raio da bolinha
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white, // Cor do ícone
                    onPressed: () {
                      Navigator.pushNamed(context, '/nineth');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.greenAccent[100],
            ),
            child: Text(
              'OS PROJETOS EM FLUTTER PODEM SER ACESSADOS PELOS TRÊS TRAÇOS NA BARRA ACIMA, DO LADO ESQUERDO',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black45),
            ),
          ),
          Expanded(
            child: Center(
              child: Lottie.asset(
                'assets/gaveta.json',
                width: 302,
                height: 202,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////