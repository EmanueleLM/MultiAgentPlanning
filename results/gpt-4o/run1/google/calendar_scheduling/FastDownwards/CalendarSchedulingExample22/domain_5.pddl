(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types participant time_slot)

  (:predicates
    (available ?p - participant ?t - time_slot)
    (scheduled ?p - participant ?t - time_slot)
    (conflicts ?p - participant ?t - time_slot)
    (free_slot ?t - time_slot)
  )

  (:action check_availability
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - time_slot)
    :precondition (and
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (free_slot ?t)
    )
    :effect (and (scheduled ?p1 ?t) (scheduled ?p2 ?t) (scheduled ?p3 ?t))
  )