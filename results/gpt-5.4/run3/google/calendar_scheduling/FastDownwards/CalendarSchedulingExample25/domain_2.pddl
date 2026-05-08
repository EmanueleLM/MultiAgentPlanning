(define (domain calendar_scheduling_example25)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_for_pamela ?s - slot)
    (chosen ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free anthony ?s)
      (free pamela ?s)
      (free zachary ?s)
      (allowed_for_pamela ?s)
    )
    :effect (chosen ?s)
  )
)