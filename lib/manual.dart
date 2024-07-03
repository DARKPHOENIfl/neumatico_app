import 'package:flutter/material.dart';

class ManualDeUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual de Usuario', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 53, 103, 177),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Introducción'),
            _buildParagraph('Bienvenido al manual de usuario de la aplicación Neumáticos. Esta aplicación te permite calcular la vida útil estimada de los neumáticos basándose en diferentes condiciones de operación de maquinaria pesada.'),

            _buildSectionTitle('Instrucciones de Uso'),
            _buildParagraph('Para utilizar la aplicación, sigue estos pasos:'),
            _buildBulletPoint('Selecciona el tipo de maquinaria.'),
            _buildBulletPoint('Elige la zona de aplicación.'),
            _buildBulletPoint('Selecciona el nivel de mantenimiento, velocidad máxima, condiciones del terreno, carga, curvas, pendientes y otras condiciones según corresponda.'),
            _buildBulletPoint('Selecciona la posición de las ruedas de impulso.'),
            _buildBulletPoint('Presiona el botón "Calcular Vida Útil".'),
            _buildBulletPoint('Se mostrará un cuadro con la vida útil estimada para el neumático delantero y el de impulso.'),
            _buildBulletPoint('Cierra el cuadro de diálogo después de revisar los resultados.'),

            _buildSectionTitle('Notas Adicionales'),
            _buildParagraph('Los factores de corrección se aplican automáticamente según las selecciones realizadas en la aplicación.'),

            _buildSectionTitle('Soporte Técnico'),
            _buildParagraph('Para obtener soporte adicional o reportar problemas técnicos, comunícate con nuestro equipo de soporte a través de support@neumaticoapp.com.'),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
