import 'package:flutter/material.dart';
import 'package:leccion_ej9_erick_lasluisa_convertir_temperatura/logica/convertir_temperatura.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final ConvertirTemperatura _convertir = ConvertirTemperatura();
  final TextEditingController _celsiusController = TextEditingController();
  String _mensaje = '';
  String _resultado = '';

  void validar() {
    setState(() {
      final celsius = double.tryParse(_celsiusController.text);
      if (celsius == null) {
        _mensaje = 'Por favor, ingrese un número válido';
        _resultado = '';
      } else {
        _mensaje = '';
        _resultado = _convertir.celsiusAFahrenheit(celsius).toStringAsFixed(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversor de Temperatura',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(100.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Conversión de Celsius a Fahrenheit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _celsiusController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Temperatura en Celsius',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorText: _mensaje.isEmpty ? null : _mensaje,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: validar,
                      icon: const Icon(Icons.thermostat),
                      label: const Text('Convertir'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Resultado:',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _resultado.isEmpty ? '' : '$_resultado °F',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
