part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
  
  @override
  List<Object> get props => [];
}

class WishListLoading extends WishlistState {}
class WishListLoaded extends WishlistState {
  final WishList wishList;
  const WishListLoaded({this.wishList=const WishList()});
    @override
  List<Object> get props => [wishList];
}

class WishListError extends WishlistState {}

