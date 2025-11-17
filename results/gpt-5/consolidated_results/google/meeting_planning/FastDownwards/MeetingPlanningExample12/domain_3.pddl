(define (domain meetingplanningexample12)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent friend location time)
  (:constants
    north_beach alamo_square - location
    barbara - friend
  )
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (jump ?from - time ?to - time)
    (travel-nb-as ?from - time ?to - time)
    (travel-as-nb ?from - time ?to - time)
    (meet-end-90-barbara ?from - time ?to - time)
    (meet-end-210-barbara ?from - time ?to - time)
    (met ?a - agent ?f - friend)
  )

  (:action wait-jump
    :parameters (?a - agent ?l - location ?from - time ?to - time)
    :precondition (and
      (at ?a ?l)
      (at-time ?from)
      (jump ?from ?to)
    )
    :effect (and
      (not (at-time ?from))
      (at-time ?to)
    )
  )

  (:action move-north_beach-to-alamo_square
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at ?a north_beach)
      (at-time ?from)
      (travel-nb-as ?from ?to)
    )
    :effect (and
      (not (at ?a north_beach))
      (at ?a alamo_square)
      (not (at-time ?from))
      (at-time ?to)
    )
  )

  (:action move-alamo_square-to-north_beach
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at ?a alamo_square)
      (at-time ?from)
      (travel-as-nb ?from ?to)
    )
    :effect (and
      (not (at ?a alamo_square))
      (at ?a north_beach)
      (not (at-time ?from))
      (at-time ?to)
    )
  )

  (:action meet-barbara-90
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at ?a alamo_square)
      (at-time ?from)
      (meet-end-90-barbara ?from ?to)
      (not (met ?a barbara))
    )
    :effect (and
      (not (at-time ?from))
      (at-time ?to)
      (met ?a barbara)
    )
  )

  (:action meet-barbara-210
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at ?a alamo_square)
      (at-time ?from)
      (meet-end-210-barbara ?from ?to)
      (not (met ?a barbara))
    )
    :effect (and
      (not (at-time ?from))
      (at-time ?to)
      (met ?a barbara)
    )
  )
)