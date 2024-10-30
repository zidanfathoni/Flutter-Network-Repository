import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_repository/di/service_locator.dart';
import 'package:flutter_network_repository/presentation/home/home_cubit.dart';
import 'package:flutter_network_repository/presentation/home/home_state.dart';

import '../../helpers/widgets/shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final cubit = getIt<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Network Repository"),
              centerTitle: true,
              actions: [
                if (!state.isLoading)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          cubit.fetchPosts();
                        },
                        child: const Icon(Icons.refresh)),
                  ),
              ],
            ),
            body: (state.isLoading)
                ? ListView.builder(
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const ShimmerEffect(),
                        ),
                      );
                    })
                : (state.posts.isEmpty && !state.isLoading)
                    ? const Center(
                        child: Text(
                          "NO POSTS FOUND!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          );
                        },
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                post.title ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(post.body ?? ""),
                            ),
                          );
                        },
                      ),
          );
        });
  }
}
