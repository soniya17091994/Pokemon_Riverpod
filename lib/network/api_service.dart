import 'dart:convert';
import 'package:pokemon_riverpod/network/network_api_service.dart';
import 'package:pokemon_riverpod/utils/constants.dart';

import '../model/pokemon.dart';

class ApiService extends NetworkApiService {
  Future<List<Pokemon>> getPokemonList() async {
    final response = await getResponse(POKEMON_API_URL);
    final List jsonResponse = json.decode(response);
    return jsonResponse.map((e) => Pokemon.fromJson(e)).toList();
    
  }
}
