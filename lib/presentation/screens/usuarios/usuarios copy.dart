import 'package:chequeo_f_h/features/register/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UsersScreenCopy extends StatelessWidget {
  const UsersScreenCopy({super.key});

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
        label: const Text('Nuevo Usuario'),
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
      
      child: DataTable(

        border: TableBorder.all(
          color: Colors.black, 
          borderRadius: BorderRadius.circular(8),
          style: BorderStyle.solid,
          width: 1.2,
          ),

        sortColumnIndex: 0,
        sortAscending: true,

        columns: const [
          DataColumn(label: Text("Nombre")),
          DataColumn(label: Text("Correo")),
        ],

        rows: _buildDataRowList(registerState),
        

        ),
      );
    
  }

    List<DataRow> _buildDataRowList(RegistersState registerState) {
    if (registerState.isLoading) {
      return [
        const DataRow(cells: [
          DataCell(Text("Cargando...")),
          DataCell(Text("")),
        ])
      ];
    } else if (registerState.register.isEmpty) {
      return [
        const DataRow(cells: [
          DataCell(Text("Error al cargar datos")),
          DataCell(Text("")),
        ])
      ];
    } else {
      return registerState.register.map((register) {
      return DataRow(
        cells: [
          DataCell(
            Text(register.fullName),
          ),
          DataCell(
            Text(register.email),
          ),
        ],
      );
    }).toList();
  }

}

}
