//helps us to create the skeleton of the application

abstract class BaseApiService {
  Future<dynamic> getResponse(String url);
}