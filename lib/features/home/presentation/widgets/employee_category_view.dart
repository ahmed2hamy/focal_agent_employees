import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_cubit.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_scroll_to_top_cubit.dart';

class EmployeeCategoryView extends StatefulWidget {
  final List<Employee> employees;

  const EmployeeCategoryView({super.key, required this.employees});

  @override
  State<EmployeeCategoryView> createState() => _EmployeeCategoryViewState();
}

class _EmployeeCategoryViewState extends State<EmployeeCategoryView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_manipulateBackToTopButton);
  }

  void _manipulateBackToTopButton() {
    if (_scrollController.offset >= 400) {
      context.read<HomeScrollToTopCubit>().showBackToTopButton();
    } else {
      context.read<HomeScrollToTopCubit>().hideBackToTopButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async => context.read<HomeCubit>().fetchEmployees(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.employees.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.employees[index].lastName ?? ""),
                subtitle: Text(widget.employees[index].firstName ?? ""),
                trailing: Text(widget.employees[index].id ?? ""),
              );
            },
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<HomeScrollToTopCubit, bool>(
        builder: (context, state) {
          return Visibility(
            visible: state,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
          );
        },
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
