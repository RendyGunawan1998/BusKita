import 'package:http/http.dart' as http;

import '../core.dart';

class InfinitListRepository {
  Future<String> listData(String url) async {
    print('CommonBloc { function: Infinit list , url GET: $url }');

    var client = http.Client();

    var token = await getStorage('token');
    print("token:: $token");
    final response = await client.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    client.close();

    // final data = json.decode(response.body);
    // print(data);
    // throw Error
    // print('res header list data :: ${response.headers}');
    // print('res body list data :: ${response.body}');
    print('s.code list data :: ${response.statusCode}');
    if (response.statusCode < 200 ||
        response.statusCode > 204 ||
        response.statusCode == 204) {
      print("error :: " + response.toString());
      print('err res body :: ${response.body}');
      throw handleErrorJson(response);
    }

    // final dataList = data['results'] as List;
    return response.body;
  }

  Future<int> postData(
      String judul, String url, String laporan, String photo) async {
    print('URl POST $judul :: $url }');

    var token = await getStorage('token');
    print("token:: $token");

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    request.headers.addAll(headers);
    request.fields['laporan'] = laporan;

    if (photo != '') {
      var photoFile = await http.MultipartFile.fromPath("file", photo);
      request.files.add(photoFile);
    }

    http.Response response =
        await http.Response.fromStream(await request.send());

    print('s.code $judul :: ${response.statusCode}');
    print('body $judul :: ${response.body}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      throw handleErrorJson(response);
    }

    return response.statusCode;
  }

  Future<int> postDataRute(
      String judul, String url, int idRute, String qr) async {
    print('URl POST $judul :: $url');

    var token = await getStorage('token');
    print("token:: $token");

    var uri = Uri.parse(url);
    var _body = {
      "perjalanan": idRute,
      "qr": qr,
    };

    var response = await http.post(
      uri,
      body: json.encode(_body),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print('s.code $judul :: ${response.statusCode}');
    print('body $judul :: ${response.body}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      throw handleErrorJson(response);
    }

    return response.statusCode;
  }

  Future<int> putLokasiDriver(
      {String judul, String url, int idmobil, String lat, String long}) async {
    print('URl PUT $judul :: $url');

    var token = await getStorage('token');
    print("token:: $token");

    var uri = Uri.parse(url);
    var _body = {
      "id": idmobil,
      "latitude": lat,
      "longitude": long,
    };

    var response = await http.put(
      uri,
      body: json.encode(_body),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print('s.code $judul :: ${response.statusCode}');
    print('body $judul :: ${response.body}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      throw handleErrorJson(response);
    }

    return response.statusCode;
  }

  Future<int> postCheckout(String judul, String url, int idPerjalanan) async {
    print('URl POST $judul :: $url');

    var token = await getStorage('token');
    print("token:: $token");

    var uri = Uri.parse(url);
    var _body = {
      "id_perjalanan": idPerjalanan,
    };

    var response = await http.post(
      uri,
      body: json.encode(_body),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print('s.code $judul :: ${response.statusCode}');
    print('body $judul :: ${response.body}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      throw handleErrorJson(response);
    }

    return response.statusCode;
  }

  Future postCheckOut(String judul, String url, int idPerjalanan) async {
    print('URl POST $judul :: $url }');

    var token = await getStorage('token');
    print("token:: $token");

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    request.headers.addAll(headers);
    request.fields['idPerjalanan'] = idPerjalanan.toString();

    http.Response response =
        await http.Response.fromStream(await request.send());

    print('s.code $judul :: ${response.statusCode}');
    print('body $judul :: ${response.body}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      print(response.body);
      throw handleErrorJson(response);
    }

    return response.statusCode;
  }
}
