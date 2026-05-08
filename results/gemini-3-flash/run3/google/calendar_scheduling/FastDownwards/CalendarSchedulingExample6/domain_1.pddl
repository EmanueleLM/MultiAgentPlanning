(define (domain calendar_scheduling)
  (:requirements :strips :typing :adl)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting_1hr
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (forall (?p - person)
        (and (free ?p ?s1) (free ?p ?s2))
      )
    )
    :effect (meeting_scheduled)
  )
)