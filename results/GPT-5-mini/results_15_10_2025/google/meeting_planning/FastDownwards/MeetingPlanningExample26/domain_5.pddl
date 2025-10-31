(define (domain meeting-planning)
  (:requirements :typing :negative-preconditions :adl :equality :action-costs)
  (:types agent location time)
  (:predicates
    (met-sarah)
    (sarah-available-span ?s - time ?e - time)
    (traveler-can-at-presidio ?s - time)
    (busy ?a - agent ?s - time ?e - time)
    (connected ?from - location ?to - location)
    (span7 ?s - time ?e - time)
    (span105 ?s - time ?e - time)
  )
  (:functions (total-cost))
  (:action travel
    :parameters (?p - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (connected ?from ?to)
      (span7 ?t1 ?t2)
      (not (busy ?p ?t1 ?t2))
    )
    :effect (and
      (busy ?p ?t1 ?t2)
    )
    :cost 7
  )
  (:action meet-with-sarah
    :parameters (?trav - agent ?s - agent ?t1 - time ?t2 - time)
    :precondition (and
      (not (met-sarah))
      (span105 ?t1 ?t2)
      (sarah-available-span ?t1 ?t2)
      (traveler-can-at-presidio ?t1)
      (not (busy ?trav ?t1 ?t2))
      (not (busy ?s ?t1 ?t2))
    )
    :effect (and
      (met-sarah)
      (busy ?trav ?t1 ?t2)
      (busy ?s ?t1 ?t2)
    )
    :cost 0
  )
)