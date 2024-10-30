import 'package:dartz/dartz.dart';
import 'package:flutter_network_repository/domain/entities/post_entity.dart';
import 'package:flutter_network_repository/domain/failures/post_failure.dart';
import 'package:flutter_network_repository/domain/model/post_json.dart';
import 'package:flutter_network_repository/domain/repositories/post_repository.dart';
import 'package:flutter_network_repository/helpers/utils.dart';
import 'package:flutter_network_repository/network/network_repository.dart';

class ApiPostRepository implements PostRepository {
  final NetworkRepository networkRepository;
  ApiPostRepository(this.networkRepository);

  @override
  Future<Either<PostFailure, List<PostEntity>>> getPosts(String url) async {
    final response = await networkRepository.get(url: url);
    if (response.failed) {
      return left(PostFailure(error: response.message));
    }
    final posts = parseList(response.data, PostJson.fromJson)
        .map((post) => post.toDomain())
        .cast<PostEntity>()
        .toList();
    return right(posts);
  }
}
