(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (not (meeting-scheduled))
      (free ?p1 ?s1) (free ?p1 ?s2)
      (free ?p2 ?s1) (free ?p2 ?s2)
      (free ?p3 ?s1) (free ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s1)
      (not (free ?p1 ?s1)) (not (free ?p1 ?s2))
      (not (free ?p2 ?s1)) (not (free ?p2 ?s2))
      (not (free ?p3 ?s1)) (not (free ?p3 ?s2))
    )
  )
)