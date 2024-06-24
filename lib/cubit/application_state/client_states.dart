
abstract class ClientStates{}

class InitialState extends ClientStates{}



class GetAllProductError extends ClientStates{}
class GetAllProductLoading extends ClientStates{}
class GetAllProductSuccess extends ClientStates{}



class GetSpecialProductError extends ClientStates{}
class GetSpecialProductLoading extends ClientStates{}
class GetSpecialProductSuccess extends ClientStates{}


class SearchedProductError extends ClientStates{}
class SearchedProductLoading extends ClientStates{}
class SearchedProductSuccess extends ClientStates{}


class getCategoryError extends ClientStates{}
class getCategoryLoading extends ClientStates{}
class getCategorySuccess extends ClientStates{}



class getDesignerError extends ClientStates{}
class getDesignerLoading extends ClientStates{}
class getDesignerSuccess extends ClientStates{}


class AddToCartLoading extends ClientStates{}
class AddToCartError extends ClientStates{}
class AddToCartSuccess extends ClientStates{}



class GetAllCartLoading extends ClientStates{}
class GetAllCartError extends ClientStates{}
class GetAllCartSuccess extends ClientStates{}







class ServerErrorClient extends ClientStates{}