import 'package:local_auth/local_auth.dart';

class LocalAuth {
  Future<void> initBiometricAuthentification() async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to show account balance',
            options: const AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true));
        didAuthenticate;
      } catch (e) {
        print(e);
      }
    }
  }
}
