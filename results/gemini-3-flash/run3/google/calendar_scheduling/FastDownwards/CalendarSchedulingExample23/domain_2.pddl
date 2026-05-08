(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      ;; Meeting must work for Billy, Maria, and William
      (free billy ?s1)
      (free billy ?s2)
      (free maria ?s1)
      (free maria ?s2)
      (free william ?s1)
      (free william ?s2)
    )
    :effect (meeting_scheduled)
  )
)