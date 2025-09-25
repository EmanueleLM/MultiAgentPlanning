(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions)
  (:types agent location moment)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - moment)
    (met-105)
    (met-360)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - moment ?t2 - moment)
    :precondition (and (at ?a ?from) (at-time ?t1))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action wait
    :parameters (?a - agent ?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (at ?a ?loc) (at-time ?t1))
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet-105
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (at ?a1 ?loc) (at ?a2 ?loc) (at-time ?t1))
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (met-105)
    )
  )

  (:action meet-extra-255
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (met-105) (at ?a1 ?loc) (at ?a2 ?loc) (at-time ?t1))
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (met-360)
    )
  )
)