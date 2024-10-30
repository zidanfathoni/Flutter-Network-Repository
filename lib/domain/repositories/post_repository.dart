import 'package:dartz/dartz.dart';
import 'package:flutter_network_repository/domain/entities/post_entity.dart';
import 'package:flutter_network_repository/domain/failures/post_failure.dart';

abstract class PostRepository {
  Future<Either<PostFailure, List<PostEntity>>> getPosts(String url);
}
