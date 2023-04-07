import 'exceptions.dart';

/// auth marker
mixin AuthenticationException {}

class UsernameNotFoundException extends BaseException
    with AuthenticationException {}

class BadCredentialsException extends BaseException
    with AuthenticationException {}

class AccountExpiredException extends BaseException
    with AuthenticationException {}

class CredentialsExpiredException extends BaseException
    with AuthenticationException {}

class AccountDisabledException extends BaseException
    with AuthenticationException {}

class AccountLockedException extends BaseException
    with AuthenticationException {}
