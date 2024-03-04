import 'package:flutter/material.dart';
import 'package:app_01u2_ourc_c/frmItem.dart';
import 'package:app_01u2_ourc_c/frmVideo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //Contructor

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MiVentana extends StatelessWidget {
  const MiVentana({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PageOne(),
    MyStepper(),
    PageThree(),
    PageFour(),    
    PageFive()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: _widgetOptions.elementAt(_selectedIndex), //Define que mostrar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          //selectedIconTheme: Ic,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Página 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Página 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Página 3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Página 4',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Página 5',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  //
  const PageOne(
      {super.key}); // La clave (key) es un identificador único que Flutter utiliza internamente para identificar widgets de manera eficiente.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            './images/flut.png', // Ruta de la imagen
            width: 250, // Ancho de la imagen
            height: 200, // Alto de la imagen
          ),
          const SizedBox(height: 20), // Espacio entre la imagen y los textos
          const Text(
            'Flutter',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 20, 92, 71),
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),

          const Text(
            'Tecnología Multiplataforma',
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            margin:
                const EdgeInsets.all(20.0), // Margen alrededor del contenedor
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey), // Borde para visualización
            ),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris aliquet justo nec eleifend interdum. Fusce posuere mi sed ligula interdum vulputate. Integer ut augue vitae enim luctus finibus.',
              textAlign: TextAlign.justify, // Ajustar texto
            ),
          ),
        ],
      ),
    );
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proceso de Programación'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Planificación'),
            content: const Column(
              children: <Widget>[
                Text('Establecer objetivos'),
                Text('Diseñar la arquitectura'),
                Text('Planificar la implementación'),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Codificación'),
            content: const Column(
              children: <Widget>[
                Text('Escribir código limpio y modular'),
                Text('Realizar pruebas unitarias'),
                Text('Integrar funcionalidades paso a paso'),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Depuración'),
            content: const Column(
              children: <Widget>[
                Text('Identificar y corregir errores'),
                Text('Optimizar el rendimiento'),
                Text('Realizar pruebas de integración'),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Formulario Simple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo electrónico';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Videos de Apoyo'),
      ),
      body: ListView(
        children: const <Widget>[
          VideoItem(
            title: 'Flutter desde cero',
            description: 'Conceptos basicos y funciones principales de Flutter',
            thumbnailAsset: './images/video1.png', // URL de la miniatura del video 1
            videoUrl: 'https://www.example.com/video1.mp4', // URL del video 1
          ),
          VideoItem(
            title: 'Programación Orientada a Objetos',
            description: 'Tutorial de POO usando Python',
            thumbnailAsset: './images/video2.png', // URL de la miniatura del video 2
            videoUrl: 'https://www.example.com/video2.mp4', // URL del video 2
          ),
          VideoItem(
              title: 'Angular v17',
              description: 'Tutorial de Angular v17',
              thumbnailAsset: './images/video3.png',
              videoUrl: 'https://www.example.com/video3.mp4')
          // Puedes agregar más elementos VideoItem según sea necesario para más videos
        ],
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  const PageFive({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frameworks más útiles'),
        centerTitle: true, // Centra el título en la barra de navegación
      ),
      body: GridView.count(
        crossAxisCount: 2, // Dos elementos por fila
        children: const <Widget>[
          FrameworkItem(
            title: 'Flutter',
            imageAsset: './images/Frm1.png',
          ),
          FrameworkItem(
            title: 'React Native',
            imageAsset: './images/Frm2.png',
          ),
          FrameworkItem(
            title: 'Angular',
            imageAsset: './images/Frm3.png',
          ),
          FrameworkItem(
            title: 'Vue.js',
            imageAsset: './images/Frm4.png',
          ),
          // Puedes agregar más elementos FrameworkItem según sea necesario
        ],
      ),
    );
  }
}