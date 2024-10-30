import 'package:bloc/bloc.dart';
import 'package:flutter_network_repository/domain/repositories/post_repository.dart';
import 'package:flutter_network_repository/presentation/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PostRepository postRepository;
  HomeCubit(this.postRepository) : super(HomeState.empty());

  Future<void> fetchPosts() async {
    emit(state.copyWith(isLoading: true));
    postRepository.getPosts("/posts").then(
          (response) => response.fold(
            (error) {
              emit(state.copyWith(isLoading: true));
            },
            (posts) {
              emit(state.copyWith(isLoading: false, posts: posts));
            },
          ),
        );
  }
}
