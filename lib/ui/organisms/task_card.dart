part of 'organisms.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.tasks,
    required this.i,
    required this.onTap,
  });

  final List<Task> tasks;
  final int i;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(tasks[i].creationDate);
    String formattedDate = DateFormat.yMMMMd().format(date);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: InkWell(
            onTap: () => onTap(tasks[i].taskId),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tasks[i].title,
                      style: TypeTitle.m,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        ChipItemWithTitle(
                          subtitle: tasks[i].status,
                          title: 'Estado',
                          color: Colors.pink[100],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ChipItemWithTitle(
                          subtitle: tasks[i].priority,
                          title: 'Prioridad',
                          color: Colors.blue[100],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Duración de la tarea: ${(int.parse(tasks[i].duration) > 1) ? '${tasks[i].duration} horas' : '${tasks[i].duration} hora'}',
                      style: TypeTitle.xs,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 14,
                        ),
                        Text(
                          formattedDate,
                          style: TypeBody.xs,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.more_vert,
          ),
        ),
      ],
    );
  }
}
