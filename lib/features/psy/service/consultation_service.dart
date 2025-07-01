class ConsultationRequest {
  final String userId;
  final DateTime requestedAt;
  final String? description;
  final String? urgency; // ex: 'emergency', 'normal'

  ConsultationRequest({
    required this.userId,
    required this.requestedAt,
    this.description,
    this.urgency,
  });
}

class ConsultationService {
  final List<ConsultationRequest> _requests = [];

  void submit(ConsultationRequest req) {
    _requests.insert(0, req);
    // Di real app, bisa POST ke API!
  }

  List<ConsultationRequest> fetchAll() => List.from(_requests);
}
