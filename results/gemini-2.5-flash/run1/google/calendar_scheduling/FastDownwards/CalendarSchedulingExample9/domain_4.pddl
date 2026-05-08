(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    time_slot
  )

  (:predicates
    (is_free ?p - participant ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot) ; Fixed: Removed extra parenthesis around :parameters
    :precondition (and
      (is_free diane ?t)
      (is_free kelly ?t)
      (is_free deborah ?t)
      (not (meeting_scheduled ?t))
    )
    :effect (and
      (meeting_scheduled ?t)
    )
  )
)