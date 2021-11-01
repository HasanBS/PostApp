import 'package:recipe_book/view/_product/network_route_enum.dart';
import 'package:recipe_book/view/post/model/post_model.dart';
import 'package:recipe_book/view/post/service/ipost_service.dart';
import 'package:vexana/vexana.dart';

class PostService extends IPostService {
  PostService(INetworkManager manager) : super(manager);

  @override
  Future<PostModel?> fechPost(int id) async {
    final response = await manager.send<PostModel, PostModel>(
        NetworkRoutes.POSTS.sValue,
        parseModel: PostModel(),
        urlSuffix: '/$id',
        method: RequestType.GET);

    return response.data;
  }

  @override
  Future<IResponseModel<List<PostModel>?>> fechPostList() async {
    final response = await manager.send<PostModel, List<PostModel>>(
        NetworkRoutes.POSTS.sValue,
        parseModel: PostModel(),
        method: RequestType.GET);

    return response;
  }
}
