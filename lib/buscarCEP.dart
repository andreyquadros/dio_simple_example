import 'package:dio/dio.dart';

class ViaCepService {
  final Dio _dio = Dio();

  Future<String> buscarCEP(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return 'CEP: ${data['cep']}, '
            'Logradouro: ${data['logradouro']}, '
            'Complemento: ${data['complemento'] ?? ''}, '
            'Bairro: ${data['bairro']}, '
            'Localidade: ${data['localidade']}, '
            'UF: ${data['uf']}';
      } else {
        throw Exception('Falhou!');
      }
    } catch (e) {
      throw Exception('Falhou: $e');
    }
  }
}
