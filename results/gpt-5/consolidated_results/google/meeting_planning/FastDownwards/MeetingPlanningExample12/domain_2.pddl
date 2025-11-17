(define (domain meetingplanningexample12)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent friend location)
  (:constants
    north_beach alamo_square - location
    barbara - friend
  )
  (:predicates
    (at ?a - agent ?l - location)
    (connected ?from - location ?to - location)
    (before-window-barbara)
    (window-open-barbara)
    (window-closed-barbara)
    (met ?a - agent ?f - friend)
  )
  (:functions
    (total-cost)
  )
  (:action move-north_beach-to-alamo_square
    :parameters (?a - agent)
    :precondition (and
      (at ?a north_beach)
      (connected north_beach alamo_square)
    )
    :effect (and
      (not (at ?a north_beach))
      (at ?a alamo_square)
      (increase (total-cost) 1)
    )
  )
  (:action move-alamo_square-to-north_beach
    :parameters (?a - agent)
    :precondition (and
      (at ?a alamo_square)
      (connected alamo_square north_beach)
    )
    :effect (and
      (not (at ?a alamo_square))
      (at ?a north_beach)
      (increase (total-cost) 1)
    )
  )
  (:action wait-until-window-open-barbara
    :parameters (?a - agent ?l - location)
    :precondition (and
      (at ?a ?l)
      (before-window-barbara)
      (not (window-open-barbara))
    )
    :effect (and
      (not (before-window-barbara))
      (window-open-barbara)
      (increase (total-cost) 1)
    )
  )
  (:action close-window-barbara
    :parameters ()
    :precondition (and
      (window-open-barbara)
      (not (window-closed-barbara))
    )
    :effect (and
      (not (window-open-barbara))
      (window-closed-barbara)
    )
  )
  (:action meet-barbara-90
    :parameters (?a - agent)
    :precondition (and
      (at ?a alamo_square)
      (window-open-barbara)
      (not (met ?a barbara))
    )
    :effect (and
      (met ?a barbara)
    )
  )
)