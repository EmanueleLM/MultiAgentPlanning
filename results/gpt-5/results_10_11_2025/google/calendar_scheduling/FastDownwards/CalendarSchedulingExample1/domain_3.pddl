(define (domain meeting-scheduler)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    raymond billy donald - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (best ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (best ?s)
      (available raymond ?s)
      (available billy ?s)
      (available donald ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)