import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';
import 'package:chequeo_f_h/features/register/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_rounded)
          )
        ],
      ),
      body: const _UsersScreen(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nuevo producto'),
        icon: const Icon( Icons.add ),
        onPressed: () {},
      ),
    );
  }
}





class _UsersScreen extends ConsumerStatefulWidget {
  const _UsersScreen();

  @override
  _UsersScreenState createState() => _UsersScreenState();
}






class _UsersScreenState extends ConsumerState {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    ref.read(registersProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final registerState = ref.watch(registersProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2, 
        mainAxisSpacing: 20,
        crossAxisSpacing: 35,
        itemCount: registerState.register.length,
        itemBuilder: (context, index) {
          final registers = registerState.register[index];
          return Text( registers.fullName );
        },
      ),
    );
  }

}
