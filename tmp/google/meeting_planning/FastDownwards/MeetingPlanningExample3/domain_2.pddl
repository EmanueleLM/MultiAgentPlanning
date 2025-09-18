(define (domain travel-meeting-coordinated)
  (:requirements :typing :strips :negative-preconditions :action-costs)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (travel-arrives ?from - location ?to - location ?ts - time ?te - time)
    (meet-allowed ?ts - time ?te - time)
    (met ?p - person ?with - person)
  )

  (:functions (total-cost))

  (:action travel-bayview-to-ggp
    :parameters (?ts - time ?te - time)
    :precondition (and
      (at traveler bayview ?ts)
      (travel-arrives bayview golden-gate-park ?ts ?te)
    )
    :effect (and
      (not (at traveler bayview ?ts))
      (at traveler golden-gate-park ?te)
      (increase (total-cost) 22)
    )
  )

  (:action travel-ggp-to-bayview
    :parameters (?ts - time ?te - time)
    :precondition (and
      (at traveler golden-gate-park ?ts)
      (travel-arrives golden-gate-park bayview ?ts ?te)
    )
    :effect (and
      (not (at traveler golden-gate-park ?ts))
      (at traveler bayview ?te)
      (increase (total-cost) 23)
    )
  )

  (:action meet-barbara
    :parameters (?ts - time ?te - time)
    :precondition (and
      (at traveler golden-gate-park ?ts)
      (at barbara golden-gate-park ?ts)
      (meet-allowed ?ts ?te)
      (not (met traveler barbara))
    )
    :effect (and
      (met traveler barbara)
    )
  )

)