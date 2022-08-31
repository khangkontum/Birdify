// part of 'club_listing_cubit.dart';

// enum ListingClubStatus { initial, submitting, success, error }

// class ListingClubState extends Equatable {
//   const ListingClubState({
//     required this.status,
//     required this.clubs,
//     this.errorStatus = '',
//   });

//   factory ListingClubState.initial() {
//     return const ListingClubState(
//       clubs: [Club.empty],
//       errorStatus: '',
//       status: ListingClubStatus.initial,
//     );
//   }

//   final List<Club> clubs;
//   final String errorStatus;
//   final ListingClubStatus status;

//   ListingClubState copyWith({
//     List<Club>? clubs,
//     String? errorStatus,
//     ListingClubStatus? status,
//   }) {
//     return ListingClubState(
//       clubs: clubs ?? this.clubs,
//       status: status ?? this.status,
//       errorStatus: errorStatus ?? this.errorStatus,
//     );
//   }

//   @override
//   List<Object> get props => [
//         errorStatus,
//         status,
//         clubs,
//       ];
// }



// // "clubCode": "seno",
// //     "name": "Kèo",
// //     "startTime": 1660973400,
// //     "endTime": 1660980600