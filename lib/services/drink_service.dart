import 'package:http/http.dart' as http;

Future<String> getDrinks(cocktailType) async {
  var _url = Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailType");

  var response = await http.get(_url);

  return response.body;
}
