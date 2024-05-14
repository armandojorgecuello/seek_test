part of 'home.dart';

class TasksHomeScreen extends ConsumerStatefulWidget {
  const TasksHomeScreen({required this.uuid, super.key});
  final String uuid;

  static Route<void> goTo({required String uuid}) => MaterialPageRoute<void>(
        builder: (_) => TasksHomeScreen(
          uuid: uuid,
        ),
      );

  @override
  ConsumerState<TasksHomeScreen> createState() => _TasksHomeScreenState();
}

class _TasksHomeScreenState extends ConsumerState<TasksHomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider.notifier).fetchTasks(widget.uuid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = ref.read(homeProvider.notifier);
    HomeState state = ref.watch(homeProvider);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Lista de tareas',
              style: TypeTitle.l,
            ),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: state.isLoading
                  ? Platform.isAndroid
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(child: CupertinoActivityIndicator())
                  : CustomScrollView(
                      slivers: <Widget>[
                        Filters(
                          select: viewModel.select,
                          selected: state.typeSelected,
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          sliver: state.tasks.isEmpty
                              ? SliverToBoxAdapter(
                                  child: SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      state.tasksFiltered != null
                                          ? 'No tienes tareas ${state.typeSelected.toLowerCase()} aún'
                                          : 'No tienes tareas añadidas aún',
                                      style: TypeTitle.l,
                                    ),
                                  ),
                                ))
                              : SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      for (var i = 0;
                                          i < state.tasks.length;
                                          i++)
                                        TaskCard(
                                          tasks: state.tasks,
                                          i: i,
                                          onTap: (value) =>
                                              viewModel.selectNewTaskStatus(
                                            value,
                                            context,
                                            widget.uuid,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                        )
                      ],
                    ),
            ),
          ),
          floatingActionButton: AddTaskButton(
            onTap: () => viewModel.navigateToCreateNewTask(
              context,
              widget.uuid,
            ),
          ),
        ),
        Visibility(
          visible: state.isUpdating,
          child: const CustomLoading(),
        ),
      ],
    );
  }
}
