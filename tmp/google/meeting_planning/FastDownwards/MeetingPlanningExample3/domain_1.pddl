(define (domain travel-meeting-coordinated)
  (:requirements :typing :strips :negative-preconditions :action-costs :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (travel-arrives ?from - location ?to - location ?ts - time ?te - time)
    (available-met ?p - person ?l - location ?ts - time ?te - time)
    (meet-allowed ?ts - time ?te - time)
    (met ?p - person ?with - person)
    (succ ?t - time ?t2 - time)
  )

  (:functions (total-cost))

  ;; Traveler travel actions (distinct named actions for travel directions)
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

  ;; Wait action to advance a person one minute while staying at same location
  (:action wait
    :parameters (?p - person ?l - location ?t - time ?t2 - time)
    :precondition (and (at ?p ?l ?t) (succ ?t ?t2))
    :effect (and
      (not (at ?p ?l ?t))
      (at ?p ?l ?t2)
      (increase (total-cost) 1)
    )
  )

  ;; Barbara commits to be available for a meeting starting at ?ts and ending at ?te
  (:action barbara-be-available-90
    :parameters (?ts - time ?te - time)
    :precondition (and
      (at barbara golden-gate-park ?ts)
      (meet-allowed ?ts ?te)
      (not (available-met barbara golden-gate-park ?ts ?te))
    )
    :effect (available-met barbara golden-gate-park ?ts ?te)
  )

  ;; Meeting action: requires both present at start and end times and Barbara's commitment.
  ;; Increases total-cost by meeting duration (90).
  (:action meet-barbara
    :parameters (?ts - time ?te - time)
    :precondition (and
      (at traveler golden-gate-park ?ts)
      (at traveler golden-gate-park ?te)
      (at barbara golden-gate-park ?ts)
      (at barbara golden-gate-park ?te)
      (available-met barbara golden-gate-park ?ts ?te)
      (meet-allowed ?ts ?te)
      (not (met traveler barbara))
    )
    :effect (and
      (met traveler barbara)
      (not (available-met barbara golden-gate-park ?ts ?te))
      (increase (total-cost) 90)
    )
  )

)