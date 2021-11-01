import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_book/core/constants/enum/http_request_enum.dart';
import 'package:recipe_book/core/init/network/icore_dio.dart';
import 'core_dio_mock.dart';
import 'core_dio_mock_model.dart';

main() {
  late ICoreDioFull service;
  setUp(() {
    service = CoreDioMock(
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  });
  test('CoreDio List', () async {
    final data = await service.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio List No Network', () async {
    final data = await service.fetchNoNetwork<List<PostModel>, PostModel>(
        '/posts',
        type: HttpTypes.GET,
        parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio Object', () async {
    final data = await service.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio Primitive', () async {
    final data = await service.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio Error', () async {
    final data = await service.fetchNoNetwork<List<PostModel>, PostModel>(
        '/posts',
        type: HttpTypes.GET,
        parseModel: PostModel());

    expect(data.data, isList);
  });
}
