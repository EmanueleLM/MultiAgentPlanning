(define (domain MeetingPlanningExample12-domain)
  (:requirements :typing :durative-actions :timed-initial-literals :negative-preconditions)
  (:types
    location
    agent
    friend
  )
  (:predicates
    (at-agent ?a - agent ?l - location)
    (at-friend ?f - friend ?l - location)
    (barbara-available)
    (met-barbara-90)
  )

  ; Asymmetric movement with fixed durations (minutes)
  (:durative-action move-northbeach-to-alamosquare
    :parameters (?a - agent)
    :duration (= ?duration 16)
    :condition (and
      (at start (at-agent ?a NorthBeach))
    )
    :effect (and
      (at start (not (at-agent ?a NorthBeach)))
      (at end   (at-agent ?a AlamoSquare))
    )
  )

  (:durative-action move-alamosquare-to-northbeach
    :parameters (?a - agent)
    :duration (= ?duration 15)
    :condition (and
      (at start (at-agent ?a AlamoSquare))
    )
    :effect (and
      (at start (not (at-agent ?a AlamoSquare)))
      (at end   (at-agent ?a NorthBeach))
    )
  )

  ; Meeting Barbara at Alamo Square with minimum duration and within availability
  (:durative-action meet-barbara
    :parameters (?a - agent)
    :duration (>= ?duration 90)
    :condition (and
      (at start (at-agent ?a AlamoSquare))
      (at start (barbara-available))
      (at start (at-friend barbara AlamoSquare))
      (over all (barbara-available))
      (over all (at-friend barbara AlamoSquare))
      (over all (at-agent ?a AlamoSquare))
    )
    :effect (and
      (at end (met-barbara-90))
    )
  )
)