(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs :fluents)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?a - agent ?l - location ?t - time)
    (can-arrive ?t - time)
    (meeting-span ?s - time ?e - time)
    (met)
  )

  (:functions (total-cost) (end-time ?t - time))

  (:action travel-you-to-nb
    :parameters (?s - time)
    :precondition (and (at you richmond) (can-arrive ?s))
    :effect (and
      (not (at you richmond))
      (at you north-beach)
      (at-time you north-beach ?s)
    )
  )

  (:action meet-at
    :parameters (?s - time ?e - time)
    :precondition (and
      (meeting-span ?s ?e)
      (at-time you north-beach ?s)
      (at-time john north-beach ?s)
      (at-time john north-beach ?e)
      (not (met))
    )
    :effect (and
      (met)
      (increase (total-cost) (end-time ?e))
    )
  )
)