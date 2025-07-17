import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';

import 'package:to_do_app/core/utiles/widgets/tap_effect.dart';
import 'package:to_do_app/features/home/controllers/add_to_do/cubit/add_to_do_cubit.dart';
import 'package:to_do_app/features/home/controllers/get_to_do_list/cubit/get_to_do_list_cubit.dart';
import 'package:to_do_app/features/home/presentation/components/custome_home_appbar.dart';
import 'package:to_do_app/features/home/presentation/components/date_widget.dart';

import 'package:to_do_app/features/to_do_details/presentation/ui_screens/Details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String _formatDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetToDoListCubit>().getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 2.h),
                  CustomHomeAppBar(),
                  SizedBox(height: 7.h),
                  BlocConsumer<GetToDoListCubit, GetToDoListState>(
                    listener: (context, state) {
                      
                    },
                    builder: (context, state) {
                      if (state is GetTodoLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is GetTodoSuccess) {
                        return Expanded(
                          child: ListView.separated(
                            itemBuilder:
                                (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => DetailsScreen(
                                              todo:
                                                  state
                                                      .todos[index], 
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.bink,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  state.todos[index].title,
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              SizedBox(
                                                height: 6.h,
                                                width: 6.w,
                                                child: SvgPicture.asset(
                                                  'assets/Icons/clock.svg',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.5.h),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  state
                                                      .todos[index]
                                                      .description,
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 15,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Text(
                                                'Created at ${_formatDate(state.todos[index].date)}',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 2.h),
                            itemCount: state.todos.length,
                          ),
                        );
                      }
                      if (state is GetTodoFailure) {
                        return Center(
                          child: Text(
                            'Error: ${state.message}',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),

              Positioned(
                bottom: 9.h,
                right: 0.w,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TapEffect(
                    onClick: () {},
                    child: CircleAvatar(
                      minRadius: 3.h,
                      maxRadius: 4.h,
                      backgroundColor: AppColors.bink,
                      child: SvgPicture.asset(
                        'assets/Icons/Theme.svg',
                        height: 10.h,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0.h,
                right: 0.w,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TapEffect(
                    onClick: () {
                      showModalBottomSheet(
                        context: context,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        isScrollControlled: true,
                        builder:
                            (context) => BlocProvider.value(
                              value: context.read<AddToDoCubit>(),
                              child: AddToDoWidet(),
                            ),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 3.h,
                      maxRadius: 4.h,
                      backgroundColor: AppColors.bink,
                      child: Icon(
                        Icons.add_rounded,
                        color: AppColors.white,
                        opticalSize: 1.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToDoWidet extends StatefulWidget {
  const AddToDoWidet({super.key});

  @override
  State<AddToDoWidet> createState() => _AddToDoWidetState();
}

class _AddToDoWidetState extends State<AddToDoWidet> {
  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final GlobalKey<DateWidgetState> dateKey = GlobalKey<DateWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      decoration: BoxDecoration(
        color: AppColors.lightbink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset('assets/Icons/Rectangle 18.svg')],
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12.0)),
            child: CustomTextFormField(
              colorx: AppColors.white,
              controller: titleTextEditingController,
              hint: 'Design UI App',
              maxlienx: 1,
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12.0)),
            child: CustomTextFormField(
              maxlienx: 17,
              colorx: AppColors.white,
              controller: descriptionTextEditingController,
              hint: 'Design UI App',
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12.0)),
            child: CustomeDateWidget(key: dateKey),
          ),

          SizedBox(height: 2.h),
          BlocConsumer<AddToDoCubit, AddToDoState>(
            listener: (context, state) {
              if (state is AddToDoSuccess) {
                Navigator.pop(context);
                print("ADDING TO FIREBASE...");
              } else if (state is AddToDoFailure) {
                print(state.error);
              }
            },
            builder: (context, state) {
              return CustomButton(
                data: 'ADD TODO',
                onClick: () {
                  final selectedDate = dateKey.currentState?.selectedDate;
                  final timestamp =
                      selectedDate != null
                          ? selectedDate.millisecondsSinceEpoch
                          : DateTime.now().millisecondsSinceEpoch;
                  context.read<AddToDoCubit>().addToDo(
                    titleTextEditingController.text,
                    descriptionTextEditingController.text,
                    DateTime.fromMillisecondsSinceEpoch(timestamp),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
