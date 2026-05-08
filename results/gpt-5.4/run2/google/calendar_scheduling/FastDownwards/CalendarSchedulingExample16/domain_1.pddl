(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    person
    slot
  )

  (:constants
    scott gabriel christine - person
  )

  (:predicates
    (busy ?p - person ?s - slot)
    (chosen ?s - slot)
    (unscheduled)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (not (busy scott ?s))
      (not (busy gabriel ?s))
      (not (busy christine ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
      (not (unscheduled))
    )
  )
)