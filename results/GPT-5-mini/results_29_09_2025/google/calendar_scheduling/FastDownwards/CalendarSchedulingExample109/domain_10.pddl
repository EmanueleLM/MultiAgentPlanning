(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types person slot)
  (:constants marie janice elijah theresa - person)
  (:predicates
    (unavailable ?p - person ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (not (unavailable marie ?s))
      (not (unavailable janice ?s))
      (not (unavailable elijah ?s))
      (not (unavailable theresa ?s))
    )
    :effect (and
      (scheduled)
      (scheduled-at ?s)
    )
    :cost 1
  )
)