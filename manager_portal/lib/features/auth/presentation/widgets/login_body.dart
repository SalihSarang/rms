import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:manager_portal/features/auth/presentation/widgets/auth_button.dart';
import 'package:manager_portal/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:manager_portal/features/sidebar/presentation/page/sidebar.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Sidebar()),
          );
        }
      },
      builder: (context, state) {
        final isVisible = state is FormEditingState
            ? state.isPasswordVisible
            : false;
        return Column(
          children: [
            // Email Input
            AuthTextField(
              label: 'Email Address',
              hintText: 'name@company.com',
              onChanged: (value) {
                context.read<AuthBloc>().add(LoginEmailChanged(value));
              },
            ),
            const SizedBox(height: 16),

            // Password Input
            AuthTextField(
              label: 'Password',
              hintText: '••••••••',
              obscureText: !isVisible,
              onChanged: (value) {
                context.read<AuthBloc>().add(LoginPasswordChanged(value));
              },
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: TextColors.secondary,
                  size: 20,
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(
                    const LoginPasswordVisibilityChanged(),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    //Implement forgot password
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: PrimaryColors.defaultColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign In Button
            AuthButton(
              text: 'Sign In',
              isLoading: state is LoadingState,
              onPressed: () {
                final bloc = context.read<AuthBloc>();
                final form = bloc.currentFormState;
                bloc.add(LoginSubmitted(form.email, form.password));
              },
            ),
          ],
        );
      },
    );
  }
}
