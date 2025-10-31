(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types person slot meeting)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?m - meeting)
    (assigned ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (scheduled ?m))
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))
    )
    :effect (and
      (scheduled ?m)
      (assigned ?m ?s)
    )
  )
)