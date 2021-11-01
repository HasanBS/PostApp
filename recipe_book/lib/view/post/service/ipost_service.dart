import 'package:recipe_book/view/post/model/post_model.dart';
import 'package:vexana/vexana.dart';

abstract class IPostService {
  final INetworkManager manager;

  IPostService(this.manager);

  Future<IResponseModel<List<PostModel>?>> fechPostList();
  Future<PostModel?> fechPost(int id);
}
