import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morg_tv/models/beat.dart';
import 'package:morg_tv/models/url_response.dart';
import 'package:riverpod/riverpod.dart';

const apiURL = "jbs52.srcf.net:9999";

FutureProvider<Map<String, Object?>> _get(
  String endpoint, {
  Map<String, dynamic>? params,
}) =>
    FutureProvider(
      (ref) async {
        final uri = Uri.https(apiURL, endpoint, params);
        final response = await http.get(uri);
        if (response.statusCode ~/ 100 != 2) {
          throw response.body;
        }
        final json = jsonDecode(response.body);
        return json;
      },
    );

FutureProvider<Beat> heart(String value) => FutureProvider<Beat>((ref) async {
      final response =
          await ref.watch(_get("/heart", params: {"value": value}).future);
      return Beat.fromJson(response);
    });

FutureProvider<URLResponse> url() => FutureProvider<URLResponse>((ref) async {
      final response = await ref.watch(_get("/url").future);
      return URLResponse.fromJson(response);
    });
