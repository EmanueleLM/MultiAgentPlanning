(define (domain meet-stephanie-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time mlevel
  )
  (:constants
    marina mission - location
  )
  (:predicates
    (at ?l - location)
    (current-time ?t - time)
    (next1 ?t1 - time ?t2 - time)
    (next19 ?t1 - time ?t2 - time)
    (next20 ?t1 - time ?t2 - time)
    (in-window ?t - time)
    (mcur ?m - mlevel)
    (mnext ?m1 - mlevel ?m2 - mlevel)
    (ge120 ?m - mlevel)
    (achieved-120)
  )

  (:action wait-1
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (current-time ?t)
      (next1 ?t ?t2)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  (:action travel-marina-mission
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at marina)
      (current-time ?t)
      (next20 ?t ?t2)
    )
    :effect (and
      (not (at marina))
      (at mission)
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  (:action travel-mission-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at mission)
      (current-time ?t)
      (next19 ?t ?t2)
    )
    :effect (and
      (not (at mission))
      (at marina)
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  (:action meet-1-below120
    :parameters (?t - time ?t2 - time ?m - mlevel ?m2 - mlevel)
    :precondition (and
      (at mission)
      (current-time ?t)
      (next1 ?t ?t2)
      (in-window ?t)
      (mcur ?m)
      (mnext ?m ?m2)
      (not (ge120 ?m2))
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (mcur ?m))
      (mcur ?m2)
    )
  )

  (:action meet-1-ge120
    :parameters (?t - time ?t2 - time ?m - mlevel ?m2 - mlevel)
    :precondition (and
      (at mission)
      (current-time ?t)
      (next1 ?t ?t2)
      (in-window ?t)
      (mcur ?m)
      (mnext ?m ?m2)
      (ge120 ?m2)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (mcur ?m))
      (mcur ?m2)
      (achieved-120)
    )
  )
)