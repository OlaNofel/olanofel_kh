import 'package:dio/dio.dart';

import '../model/model_chat.dart';

abstract class ChatData {
  Dio dio = Dio();
  late Response response;
  String burl = 'https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people';
  Future<List<ModelChat>> getAllQuiz();
}

class ChatDataImp extends ChatData {
  @override
  Future<List<ModelChat>> getAllQuiz() async {
    try {
      response = await dio.get(burl);

      if (response.statusCode == 200) {
        List<ModelChat> question = List.generate(response.data.length,
            (index) => ModelChat.fromMap(response.data[index]));
        return question;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e);
      return [];
    }
  }
}
