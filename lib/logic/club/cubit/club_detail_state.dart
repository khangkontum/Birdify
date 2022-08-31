part of 'club_detail_cubit.dart';

enum DetailClubStatus { initial, submitting, success, error }

class DetailClubState extends Equatable {
  const DetailClubState({
    required this.club,
    required this.status,
    this.errorStatus = '',
  });

  factory DetailClubState.initial() {
    return const DetailClubState(
      club: Club.empty,
      errorStatus: '',
      status: DetailClubStatus.initial,
    );
  }

  final Club club;
  final String errorStatus;
  final DetailClubStatus status;

  DetailClubState copyWith({
    Club? club,
    String? errorStatus,
    DetailClubStatus? status,
  }) {
    return DetailClubState(
      club: club ?? this.club,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        club,
      ];
}
