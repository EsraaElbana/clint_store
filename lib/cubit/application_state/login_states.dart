

abstract class LoginStates {}


class InitialState extends LoginStates{}



class LoginError extends LoginStates{}
class LoginLoading extends LoginStates{}
class LoginSuccess extends LoginStates{}
class ServerErrorLogin extends LoginStates{}
