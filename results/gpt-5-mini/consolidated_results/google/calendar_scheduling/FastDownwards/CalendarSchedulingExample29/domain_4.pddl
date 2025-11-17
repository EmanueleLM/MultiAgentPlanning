(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:constants
    madison diana shirley - person
  )

  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (not (meeting_scheduled))
      (free madison ?s1) (free madison ?s2)
      (free diana   ?s1) (free diana   ?s2)
      (free shirley ?s1) (free shirley ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (not (free madison ?s1)) (not (free madison ?s2))
      (not (free diana   ?s1)) (not (free diana   ?s2))
      (not (free shirley ?s1)) (not (free shirley ?s2))
    )
  )
)