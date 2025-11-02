(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?a - agent ?l - location ?t - time)
    (can-arrive ?t - time)
    (meeting-span ?s - time ?e - time)
    (met)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t - time)
    :precondition (and (at ?a ?from) (can-arrive ?t))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (at-time ?a ?to ?t)
    )
  )

  (:action meet
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?s - time ?e - time)
    :precondition (and
      (meeting-span ?s ?e)
      (at-time ?a1 ?loc ?s)
      (at-time ?a1 ?loc ?e)
      (at-time ?a2 ?loc ?s)
      (at-time ?a2 ?loc ?e)
      (not (met))
    )
    :effect (and
      (met)
    )
  )
)