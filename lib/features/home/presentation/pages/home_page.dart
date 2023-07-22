import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/constants/constants.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_cubit.dart';
import 'package:focal_agent_employees/features/home/presentation/widgets/employee_category_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            final itEmployees =
                state.employees.whereType<ITEmployee>().toList();
            final hrEmployees =
                state.employees.whereType<HREmployee>().toList();

            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: Strings.it),
                      Tab(text: Strings.hr),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        EmployeeCategoryView(employees: itEmployees),
                        EmployeeCategoryView(employees: hrEmployees),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
