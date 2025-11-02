(define (domain rendezvous)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent friend location timepoint)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?f - friend)
    (time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (route ?from - location ?to - location)
    (available ?f - friend ?l - location)
  )

  (:action move
    :parameters (?a - agent ?from - location ?to - location ?tfrom - timepoint ?tto - timepoint)
    :precondition (and (at ?a ?from) (route ?from ?to) (time ?tfrom) (next ?tfrom ?tto))
    :effect (and (not (at ?a ?from)) (at ?a ?to) (not (time ?tfrom)) (time ?tto))
  )

  (:action wait
    :parameters (?a - agent ?loc - location ?tfrom - timepoint ?tto - timepoint)
    :precondition (and (at ?a ?loc) (time ?tfrom) (next ?tfrom ?tto))
    :effect (and (not (time ?tfrom)) (time ?tto))
  )

  (:action meet
    :parameters (?a - agent ?f - friend ?l - location ?tfrom - timepoint ?tto - timepoint)
    :precondition (and (at ?a ?l) (available ?f ?l) (time ?tfrom) (next ?tfrom ?tto) (not (met ?a ?f)))
    :effect (and (met ?a ?f) (not (time ?tfrom)) (time ?tto))
  )
)