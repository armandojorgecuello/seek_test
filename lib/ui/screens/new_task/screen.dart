part of 'new_task.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  const NewTaskScreen({required this.uuid, super.key});
  final String uuid;

  static Route<void> goTo({required String uuid}) => MaterialPageRoute<void>(
        builder: (_) => NewTaskScreen(
          uuid: uuid,
        ),
      );

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController creationDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NewTaskViewModel viewModel = ref.read(homeProvider.notifier);
    NewTaskState state = ref.watch(homeProvider);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Crear nueva tarea',
              style: TypeTitle.l,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Form(
                key: _form,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text(
                            'Título',
                            style: TypeTitle.s,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ApptextField(
                            controller: titleController,
                            onChanged: viewModel.updateTitle,
                          ),
                          Text(
                            'Fecha de creación',
                            style: TypeTitle.s,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              String? stringDate =
                                  await viewModel.selectCreationDate(context);
                              if (stringDate != null) {
                                viewModel.updateDate(
                                  stringDate,
                                );
                                DateTime date = DateTime.parse(stringDate);
                                final dateFormatted = dateFormat.format(date);
                                creationDateController.text = dateFormatted;
                                setState(() {});
                              }
                            },
                            child: ApptextField(
                              controller: creationDateController,
                              onChanged: viewModel.updateDate,
                              isEnabled: false,
                            ),
                          ),
                          Text(
                            'Descripción de la tarea',
                            style: TypeTitle.s,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ApptextField(
                            controller: descriptionController,
                            onChanged: viewModel.updateDescription,
                          ),
                          Text(
                            'Prioridad',
                            style: TypeTitle.s,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ApptextField(
                            controller: priorityController,
                            onChanged: viewModel.updatePriority,
                          ),
                          Text(
                            'Duración (En Horas)',
                            style: TypeTitle.s,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ApptextField(
                            controller: durationController,
                            onChanged: viewModel.updateDuration,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              title: 'Crear tarea',
              onPressed: () => viewModel.createNewTask(
                _form,
                state.taskDTO,
                widget.uuid,
                context,
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.isLoading,
          child: const CustomLoading(),
        ),
      ],
    );
  }
}
