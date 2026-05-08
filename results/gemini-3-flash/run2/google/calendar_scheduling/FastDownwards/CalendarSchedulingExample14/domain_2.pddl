(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting_scheduled ?p1 - person ?p2 - person ?p3 - person)
  )

  ;; Action to schedule a half-hour meeting for three people in a specific slot.
  ;; The preconditions ensure that all three people are available during that time.
  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s - slot)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (meeting_scheduled ?p1 ?p2 ?p3)
  )
)