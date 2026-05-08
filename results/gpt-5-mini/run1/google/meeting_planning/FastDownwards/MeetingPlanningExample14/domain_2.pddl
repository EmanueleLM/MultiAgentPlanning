(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (free ?a - agent ?t - time)
    (travel_link ?from - location ?to - location ?tfrom - time ?tto - time)
    (met-with-mary)
    (is-mary ?a - agent)
    (next ?tfrom - time ?tto - time)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?a ?from ?tfrom)
      (free ?a ?tfrom)
      (free ?a ?tto)
      (travel_link ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at ?a ?from ?tfrom))
      (at ?a ?to ?tto)
      (not (free ?a ?tfrom))
      (not (free ?a ?tto))
    )
  )

  (:action stay
    :parameters (?a - agent ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?a ?loc ?tfrom)
      (free ?a ?tto)
    )
    :effect (and
      (at ?a ?loc ?tto)
      (not (free ?a ?tto))
    )
  )

  (:action meet_mary
    :parameters (?a - agent ?m - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (is-mary ?m)
      (at ?a ?loc ?t1)
      (at ?m ?loc ?t1)
      (at ?a ?loc ?t2)
      (at ?m ?loc ?t2)
      (free ?a ?t1)
      (free ?a ?t2)
      (free ?m ?t1)
      (free ?m ?t2)
      (next ?t1 ?t2)
    )
    :effect (and
      (met-with-mary)
      (not (free ?a ?t1))
      (not (free ?a ?t2))
      (not (free ?m ?t1))
      (not (free ?m ?t2))
    )
  )
)