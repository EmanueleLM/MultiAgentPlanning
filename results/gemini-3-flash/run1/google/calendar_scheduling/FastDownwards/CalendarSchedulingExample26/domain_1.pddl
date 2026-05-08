(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_1hr
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free katherine ?s1)
      (free katherine ?s2)
      (free nicole ?s1)
      (free nicole ?s2)
      (free kevin ?s1)
      (free kevin ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)