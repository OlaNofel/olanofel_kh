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
  Future<List<ModelChat>> getAlldata() async {
    try {
      response = await dio.get(burl);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.data);
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

  @override
  Future<List<ModelChat>> getAllQuiz() {
    // TODO: implement getAllQuiz
    throw UnimplementedError();
  }
}
