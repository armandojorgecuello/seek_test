part of 'molecules.dart';

class TaskStatusSelector extends StatelessWidget {
  final Function(String) selected;
  const TaskStatusSelector({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
          'Selecciona el estado actual de tu tarea',
          style: TypeTitle.l,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        ItemStatus(
          selected: selected,
          title: 'En progreso',
        ),
        ItemStatus(
          selected: selected,
          title: 'Cancelada',
        ),
        InkWell(
          onTap: () => selected('Completada'),
          child: Text(
            'Completada',
            style: TypeBody.m,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ItemStatus extends StatelessWidget {
  final String title;
  final Function(String) selected;
  const ItemStatus({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => selected(title),
            child: Text(
              title,
              style: TypeBody.m,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
