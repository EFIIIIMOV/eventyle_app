import 'package:eventyle_app/features/event/domain/usecases/get_all_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '/features/auth/presentation/view/sign_in_view.dart';
import 'core/constants/theme/themeData.dart';
import 'features/auth/presentation/view/sign_up_auth_info_view.dart';
import 'features/auth/presentation/view/sign_up_user_info_view.dart';
import 'features/auth/presentation/viewmodel/sign_in_view_model.dart';
import 'features/auth/presentation/viewmodel/sign_up_auth_info_view_model.dart';
import 'features/auth/presentation/viewmodel/sign_up_user_info_view_model.dart';
import 'features/chat/presentation/view/chat_create_view/chat_create_view.dart';
import 'features/chat/presentation/view/chat_list_view/chat_list_view.dart';
import 'features/chat/presentation/view/chat_view/chat_view.dart';
import 'features/chat/presentation/viewmodel/chat_create_view_model.dart';
import 'features/chat/presentation/viewmodel/chat_list_view_model.dart';
import 'features/chat/presentation/viewmodel/chat_view_model.dart';
import 'features/event/data/datasources/event_remote_data_source.dart';
import 'features/event/data/repositories/event_repository_impl.dart';
import 'features/event/presentation/view/create_event_info_view/create_event_info_view.dart';
import 'features/event/presentation/view/create_event_view/create_event_view.dart';
import 'features/event/presentation/view/event_info_view/event_info_view.dart';
import 'features/event/presentation/view/event_main_view/event_main_view.dart';
import 'features/event/presentation/view/events_list_view/events_list_view.dart';
import 'features/event/presentation/viewmodel/create_event_info_view_model.dart';
import 'features/event/presentation/viewmodel/create_event_view_model.dart';
import 'features/event/presentation/viewmodel/event_main_view_model.dart';
import 'features/event/presentation/viewmodel/events_list_view_model.dart';
import 'features/found_users/presentation/view/user_list_view/user_list_view.dart';
import 'features/profile/presentation/view/profile_create_post_view/profile_create_post_view.dart';
import 'features/profile/presentation/view/profile_edit_view/profile_edit_view.dart';
import 'features/profile/presentation/view/profile_main_view/profile_main_view.dart';
import 'features/profile/presentation/viewmodel/profile_create_post_view_model.dart';
import 'features/profile/presentation/viewmodel/profile_edit_view_model.dart';
import 'features/profile/presentation/viewmodel/profile_main_view_model.dart';
import 'package:dcdg/dcdg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //AUTH
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpAuthInfoViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpUserInfoViewModel()),

        //EVENT
        ChangeNotifierProvider(create: (context) => CreateEventInfoViewModel()),
        ChangeNotifierProvider(create: (context) => CreateEventViewModel()),
        ChangeNotifierProvider(create: (context) => EventMainViewModel()),
        ChangeNotifierProvider(create: (context) => EventsListViewModel()),

        //PROFILE
        ChangeNotifierProvider(
            create: (context) => ProfileCreatePostViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileEditViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileMainViewModel()),

        //CHAT
        ChangeNotifierProvider(create: (context) => ChatCreateViewModel()),
        ChangeNotifierProvider(create: (context) => ChatListViewModel()),
        ChangeNotifierProvider(create: (context) => ChatViewModel()),
      ],
      child: MaterialApp(
        //debugShowMaterialGrid: true,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        theme: CustomThemeData,
        routes: {
          '/': (context) => SignInView(),
          '/signUp': (context) => SignAuthInfoUpView(),
          '/signUpUserInfo': (context) => SignUpUserInfoView(),
          '/events': (context) => EventsListView(),
          '/eventMain': (context) => EventMainView(),
          '/eventCreate': (context) => CreateEventView(),
          '/eventInfoCreate': (context) => CreateEventInfoView(),
          '/eventInfo': (context) => EventInfoView(),
          '/profile': (context) => ProfileMainView(),
          '/profileEdit': (context) => ProfileEditView(),
          '/profilePostCreate': (context) => ProfileCreatePostView(),
          '/chatList': (context) => ChatListView(),
          '/chatCreate': (context) => ChatCreateView(),
          '/chatMain': (context) => ChatMainView(),
          '/userList': (context) => UserListView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
