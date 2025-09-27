(define (domain meeting)
  (:requirements :strips :typing :disjunctive-preconditions)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available elijah ?s)
      (available janet ?s)
      (available brian ?s)
      (available carl ?s)
      (available timothy ?s)
    )
    :effect (scheduled ?s)
  )
)