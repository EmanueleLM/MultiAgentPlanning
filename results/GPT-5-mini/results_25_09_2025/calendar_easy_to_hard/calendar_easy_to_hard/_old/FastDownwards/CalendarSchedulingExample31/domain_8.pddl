(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot)
  (:constants amy jonathan brittany matthew catherine carl - person)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule-meeting-at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s) (free jonathan ?s) (free brittany ?s)
      (free matthew ?s) (free catherine ?s) (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free amy ?s)) (not (free jonathan ?s)) (not (free brittany ?s))
      (not (free matthew ?s)) (not (free catherine ?s)) (not (free carl ?s))
    )
  )
)