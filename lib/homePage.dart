import 'package:dio_app_test/buscarCEP.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  String retornoAPI = '';
  Widget build(BuildContext context) {
    TextEditingController cep_TextEditingController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador via CEP', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(

              controller: cep_TextEditingController,
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ()  async {
              String resultado = await ViaCepService().buscarCEP(cep_TextEditingController.text);
              print('Resultado da API: $resultado');
              setState(()  {
                retornoAPI = resultado;
              });
            }, child: Text('Consultar')),
            SizedBox(height: 30,),
            Text('Campos retornados: ${retornoAPI}', style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),
    );
  }
}
