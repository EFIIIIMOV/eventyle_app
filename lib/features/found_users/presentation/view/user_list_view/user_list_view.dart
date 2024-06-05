import 'package:eventyle_app/features/found_users/presentation/view/user_list_view/widgets/user_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/user_list_view_model.dart';
import 'widgets/user_search_field.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late final TextEditingController _searchQuery;
  late final UserListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    viewModel = context.read<UserListViewModel>();
    viewModel.getListUsersInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Пользователи',
        buttonIcon: Icons.star_outline_sharp,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
      body: Column(
        children: [
          UserSearchField(
            searchQuery: _searchQuery,
            onPressed: () => viewModel.filterResult(_searchQuery.text),
          ),
          Consumer<UserListViewModel>(
            builder: (context, viewModel, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: viewModel.listUsersInfo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => viewModel.onUserPressed(context, index),
                      child: UserListTileCard(
                        user_id: viewModel.listUsersInfo[index].user_id,
                        name: viewModel.listUsersInfo[index].name,
                        surname: viewModel.listUsersInfo[index].surname,
                        role: viewModel.listUsersInfo[index].role,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
