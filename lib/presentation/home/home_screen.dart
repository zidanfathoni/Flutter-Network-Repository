import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_repository/presentation/home/home_cubit.dart';
import 'package:flutter_network_repository/presentation/home/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/widgets/shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.homeCubit});
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Network Repository"),
              centerTitle: true,
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
                          height: 0.2.sh,
                          width: 0.7.sw,
                          child: const ShimmerEffect(),
                        ),
                      );
                    })
                : (state.posts.isEmpty && state.isLoading)
                    ? SizedBox(
                        height: 0.5.sh,
                        child: const Center(
                          child: Text(
                            "No Issues found",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                title: Text(post.title ?? ""),
                                subtitle: Text(post.body ?? ""),
                              ),
                            ),
                          );
                        },
                      ),
          );
        });
  }
}
