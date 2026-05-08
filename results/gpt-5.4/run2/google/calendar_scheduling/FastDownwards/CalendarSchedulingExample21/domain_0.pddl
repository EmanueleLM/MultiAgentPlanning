(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    bobby scott kimberly - participant
  )

  (:predicates
    (participant_free_for_start ?p - participant ?s - slot)
    (candidate_start ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (candidate_start ?s)
      (not (meeting_scheduled))
      (participant_free_for_start bobby ?s)
      (participant_free_for_start scott ?s)
      (participant_free_for_start kimberly ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)