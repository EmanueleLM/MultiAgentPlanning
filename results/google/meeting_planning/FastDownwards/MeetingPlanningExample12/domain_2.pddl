(define (domain MeetingPlanningExample12-strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent friend location time minute
  )
  (:predicates
    (at ?a - agent ?l - location)
    (in-transit ?a - agent ?l1 - location ?l2 - location)
    (meeting ?a - agent ?f - friend)
    (free ?a - agent)
    (met-barbara)
    (time ?t - time)
    (next ?t1 - time ?t2 - time)
    (barbara-available ?t - time)
    (move-rem ?m - minute)
    (meet-rem ?m - minute)
    (dec ?m1 - minute ?m2 - minute)
  )

  (:action wait-1
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and (free ?a) (time ?t1) (next ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2))
  )

  (:action begin-move-northbeach-to-alamosquare
    :parameters (?a - agent ?t - time)
    :precondition (and (free ?a) (time ?t) (at ?a NorthBeach))
    :effect (and
      (not (free ?a))
      (in-transit ?a NorthBeach AlamoSquare)
      (not (at ?a NorthBeach))
      (move-rem m016)
    )
  )

  (:action begin-move-alamosquare-to-northbeach
    :parameters (?a - agent ?t - time)
    :precondition (and (free ?a) (time ?t) (at ?a AlamoSquare))
    :effect (and
      (not (free ?a))
      (in-transit ?a AlamoSquare NorthBeach)
      (not (at ?a AlamoSquare))
      (move-rem m015)
    )
  )

  (:action move-step
    :parameters (?a - agent ?l1 - location ?l2 - location ?m1 - minute ?m2 - minute ?t1 - time ?t2 - time)
    :precondition (and
      (in-transit ?a ?l1 ?l2)
      (move-rem ?m1)
      (dec ?m1 ?m2)
      (time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      (not (move-rem ?m1))
      (move-rem ?m2)
    )
  )

  (:action finish-move
    :parameters (?a - agent ?l1 - location ?l2 - location)
    :precondition (and
      (in-transit ?a ?l1 ?l2)
      (move-rem m000)
    )
    :effect (and
      (not (in-transit ?a ?l1 ?l2))
      (not (move-rem m000))
      (at ?a ?l2)
      (free ?a)
    )
  )

  (:action start-meeting-barbara
    :parameters (?a - agent ?t - time)
    :precondition (and
      (free ?a)
      (time ?t)
      (at ?a AlamoSquare)
      (barbara-available ?t)
    )
    :effect (and
      (not (free ?a))
      (meeting ?a barbara)
      (meet-rem m090)
    )
  )

  (:action meeting-step
    :parameters (?a - agent ?m1 - minute ?m2 - minute ?t1 - time ?t2 - time)
    :precondition (and
      (meeting ?a barbara)
      (meet-rem ?m1)
      (dec ?m1 ?m2)
      (time ?t1)
      (next ?t1 ?t2)
      (barbara-available ?t1)
      (at ?a AlamoSquare)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      (not (meet-rem ?m1))
      (meet-rem ?m2)
    )
  )

  (:action finish-meeting-barbara
    :parameters (?a - agent)
    :precondition (and
      (meeting ?a barbara)
      (meet-rem m000)
      (at ?a AlamoSquare)
    )
    :effect (and
      (not (meeting ?a barbara))
      (not (meet-rem m000))
      (free ?a)
      (met-barbara)
    )
  )
)