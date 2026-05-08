(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?s - slot)
  )

  (:action schedule_meeting_1_at_11_00
    :parameters ()
    :precondition (and
      (not (scheduled meeting_1))
      (requires meeting_1 brittany)
      (requires meeting_1 emily)
      (requires meeting_1 doris)
      (free brittany s_11_00)
      (free emily s_11_00)
      (free doris s_11_00)
    )
    :effect (and
      (scheduled meeting_1)
      (scheduled_in meeting_1 s_11_00)
    )
  )
)