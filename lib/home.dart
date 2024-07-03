import 'package:flutter/material.dart';
import 'package:neumatico_app/main.dart';
import 'package:neumatico_app/manual.dart';
import 'menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumáticos',
      routes: {
        '/manual_de_usuario':(context) => ManualDeUsuario()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String maquinaria = 'Camiones de Construcción y Minería';
  String zona = 'A';
  String mantenimiento = 'Excelente';
  String velocidad = '16 km/h ~ 10 mph';
  String terreno = 'Tierra blanda — Sin roca';
  String carga = 'Carga recomendada';
  String curvas = 'Ninguna';
  String pendientes = 'Nivel';
  String otras = 'Ninguna';
  String impulso = 'Impulsora (Descarga trasera)';

  final maquinarias = [
    'Motoniveladoras',
    'Minicargadores',
    'Máquinas LHD (Carga-Acarreo-Descarga)',
    'Arrastradores de Troncos',
    'Mototraíllas',
    'Camiones de Construcción y Minería',
    'Camiones para Minería Subterránea',
    'Tractores/Vagones',
    'Camiones Articulados',
    'Tractores de Ruedas'
  ];

  final zonas = ['A', 'B', 'C'];
  final mantenimientos = ['Excelente', 'De fragmentación mediana', 'Mal fragmentada'];
  final velocidades = ['16 km/h ~ 10 mph', '32 km/h ~ 20 mph', '48 km/h ~ 30 mph'];
  final terrenos = [
    'Tierra blanda — Sin roca',
    'Tierra blanda — Algunas rocas',
    'Bien mantenido — Camino de grava',
    'Mal mantenido — Camino de grava',
    'Voladura — Rocas afiladas'
  ];
  final cargas = ['Carga recomendada', '20 % Sobrecarga', '40 % Sobrecarga'];
  final curvass = ['Ninguna', 'Media', 'Severa'];
  final pendentess = ['Nivel', '5 % máximo', '15 % máximo'];
  final otrass = ['Ninguna', 'Media', 'Severa'];
  final posicionRuedass = ['Remolque', 'Delante', 'Impulsora (Descarga trasera)', 'Impulsora (Descarga por el fondo)', 'Impulsora (Mototraílla)'];

  final zonasValores = {
    'Motoniveladoras': {'A': 4000, 'B': 3000, 'C': 1500},
    'Minicargadores': {'A': 5500, 'B': 3500, 'C': 2000},
    'Máquinas LHD (Carga-Acarreo-Descarga)': {'A': 2000, 'B': 1500, 'C': 1000},
    'Arrastradores de Troncos': {'A': 6000, 'B': 4000, 'C': 2000},
    'Mototraíllas': {'A': 5000, 'B': 3000, 'C': 1500},
    'Camiones de Construcción y Minería': {'A': 6000, 'B': 4000, 'C': 2000},
    'Camiones para Minería Subterránea': {'A': 4000, 'B': 3000, 'C': 2000},
    'Tractores/Vagones': {'A': 12000, 'B': 8000, 'C': 9000},
    'Camiones Articulados': {'A': 7000, 'B': 5500, 'C': 3000},
    'Tractores de Ruedas': {'A': 6000, 'B': 3000, 'C': 1000}
  };

  final factoresMantenimiento = {
    'Excelente': 1.090,
    'De fragmentación mediana': 0.981,
    'Mal fragmentada': 0.763
  };

  final factoresVelocidad = {
    '16 km/h ~ 10 mph': 1.090,
    '32 km/h ~ 20 mph': 0.872,
    '48 km/h ~ 30 mph': 0.763
  };

  final factoresTerreno = {
    'Tierra blanda — Sin roca': 1.090,
    'Tierra blanda — Algunas rocas': 0.981,
    'Bien mantenido — Camino de grava': 0.981,
    'Mal mantenido — Camino de grava': 0.763,
    'Voladura — Rocas afiladas': 0.654
  };

  final factoresCarga = {
    'Carga recomendada': 1.090,
    '20 % Sobrecarga': 0.872,
    '40 % Sobrecarga': 0.545
  };

  final factoresCurvas = {'Ninguna': 1.090, 'Media': 0.981, 'Severa': 0.872};

  final factoresPendientes = {'Nivel': 1.090, '5 % máximo': 0.981, '15 % máximo': 0.763};

  final factoresOtras = {'Ninguna': 1.090, 'Media': 0.981, 'Severa': 0.872};

  final factoresPosicionRuedas = {
    'Remolque': 1.090,
    'Delante': 0.981,
    'Impulsora (Descarga trasera)': 0.872,
    'Impulsora (Descarga por el fondo)': 0.763,
    'Impulsora (Mototraílla)': 0.654
  };

  double calcularVidaUtil(bool esDelantero) {
    double baseHoras = zonasValores[maquinaria]![zona]!.toDouble();
    double factorMantenimiento = factoresMantenimiento[mantenimiento]!;
    double factorVelocidad = factoresVelocidad[velocidad]!;
    double factorTerreno = factoresTerreno[terreno]!;
    double factorCarga = factoresCarga[carga]!;
    double factorCurvas = factoresCurvas[curvas]!;
    double factorPendientes = factoresPendientes[pendientes]!;
    double factorOtras = carga == 'Carga recomendada' ? 1.0 : factoresOtras[otras]!;
    double factorPosicionRuedas = esDelantero ? factoresPosicionRuedas['Delante']! : factoresPosicionRuedas[impulso]!;

    if (carga != 'Carga recomendada') {
      factorCarga = factoresCarga[carga]!;
      factorOtras = factoresOtras[otras]!;
    }

    double vidaUtil = baseHoras *
        factorMantenimiento *
        factorVelocidad *
        factorTerreno *
        factorCarga *
        factorCurvas *
        factorPendientes *
        factorOtras *
        factorPosicionRuedas;

    return vidaUtil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de Vida\nÚtil de Neumáticos', 
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => UserManualScreen()),
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
          },
        ),
        centerTitle: true, // Centra el título
        backgroundColor: Color.fromARGB(255, 53, 103, 177),
      ),
      // drawer: Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownButtonFormField(
                labelText: 'Tipo de Maquinaria',
                value: maquinaria,
                items: maquinarias,
                onChanged: (String? newValue) {
                  setState(() {
                    maquinaria = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Zona de aplicación',
                value: zona,
                items: zonas,
                onChanged: (String? newValue) {
                  setState(() {
                    zona = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Mantenimiento',
                value: mantenimiento,
                items: mantenimientos,
                onChanged: (String? newValue) {
                  setState(() {
                    mantenimiento = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Velocidad máxima',
                value: velocidad,
                items: velocidades,
                onChanged: (String? newValue) {
                  setState(() {
                    velocidad = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Condiciones del terreno',
                value: terreno,
                items: terrenos,
                onChanged: (String? newValue) {
                  setState(() {
                    terreno = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Cargas',
                value: carga,
                items: cargas,
                onChanged: (String? newValue) {
                  setState(() {
                    carga = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Curvas',
                value: curvas,
                items: curvass,
                onChanged: (String? newValue) {
                  setState(() {
                    curvas = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Pendientes',
                value: pendientes,
                items: pendentess,
                onChanged: (String? newValue) {
                  setState(() {
                    pendientes = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Otras combinaciones varias',
                value: otras,
                items: otrass,
                onChanged: (String? newValue) {
                  setState(() {
                    otras = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              _buildDropdownButtonFormField(
                labelText: 'Impulso',
                value: impulso,
                items: posicionRuedass,
                onChanged: (String? newValue) {
                  setState(() {
                    impulso = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double vidaUtilDelantero = calcularVidaUtil(true);
                  double vidaUtilImpulso = calcularVidaUtil(false);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Vida Útil Estimada'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vida útil estimada (Delantero): ${vidaUtilDelantero.toStringAsFixed(0)} horas'),
                            Text('Vida útil estimada (Impulso): ${vidaUtilImpulso.toStringAsFixed(0)} horas'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Calcular Vida Útil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildDropdownButtonFormField({
  required String labelText,
  required String value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0), // Ajusta el relleno vertical
        ),
        isExpanded: true, // Permite que el DropdownButtonFormField use todo el ancho disponible
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      )
    ],
  );
}
}
