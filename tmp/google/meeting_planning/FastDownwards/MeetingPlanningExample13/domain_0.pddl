(define (domain orchestrated-meetings)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)    ; agent at location
    (betty-at ?l - location)         ; Betty's location (fixed)
    (met ?a - agent)                 ; agent has completed a 75-minute meeting with Betty
  )

  (:functions
    (time)               ; global clock: minutes since midnight
    (meetings-count)     ; total number of completed 75-minute meetings with Betty
  )

  ;; Travel actions for "you"
  (:action travel-you-presidio-to-north_beach
    :parameters ()
    :precondition (at you presidio)
    :effect (and
      (not (at you presidio))
      (at you north_beach)
      (increase (time) 18)
    )
  )

  (:action travel-you-north_beach-to-presidio
    :parameters ()
    :precondition (at you north_beach)
    :effect (and
      (not (at you north_beach))
      (at you presidio)
      (increase (time) 17)
    )
  )

  ;; Travel actions for "agent2"
  (:action travel-agent2-presidio-to-north_beach
    :parameters ()
    :precondition (at agent2 presidio)
    :effect (and
      (not (at agent2 presidio))
      (at agent2 north_beach)
      (increase (time) 18)
    )
  )

  (:action travel-agent2-north_beach-to-presidio
    :parameters ()
    :precondition (at agent2 north_beach)
    :effect (and
      (not (at agent2 north_beach))
      (at agent2 presidio)
      (increase (time) 17)
    )
  )

  ;; Wait (increment clock by 1 minute) for each agent (can be used repeatedly to advance time)
  (:action wait-you-1min
    :parameters (?l - location)
    :precondition (at you ?l)
    :effect (and
      (increase (time) 1)
    )
  )

  (:action wait-agent2-1min
    :parameters (?l - location)
    :precondition (at agent2 ?l)
    :effect (and
      (increase (time) 1)
    )
  )

  ;; Meet Betty actions for each agent.
  ;; Betty's availability window is [1125, 1320]. Each meeting is 75 minutes.
  ;; To ensure meeting fully fits in window, meeting start must satisfy:
  ;; 1125 <= time <= 1320 - 75 = 1245.
  ;; Meeting action advances the time by 75 minutes and increases meetings count.
  (:action meet-you
    :parameters (?l - location)
    :precondition (and
      (at you ?l)
      (betty-at ?l)
      (>= (time) 1125)
      (<= (time) 1245)
      (not (met you))
    )
    :effect (and
      (met you)
      (increase (time) 75)
      (increase (meetings-count) 1)
    )
  )

  (:action meet-agent2
    :parameters (?l - location)
    :precondition (and
      (at agent2 ?l)
      (betty-at ?l)
      (>= (time) 1125)
      (<= (time) 1245)
      (not (met agent2))
    )
    :effect (and
      (met agent2)
      (increase (time) 75)
      (increase (meetings-count) 1)
    )
  )
)