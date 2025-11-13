(define (domain MeetingPlanningExample12-strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent friend location timestep minute
  )
  (:predicates
    (at ?a - agent ?l - location)
    (in-transit ?a - agent ?l1 - location ?l2 - location)
    (meeting ?a - agent ?f - friend)
    (free ?a - agent)
    (met-barbara)
    (now ?t - timestep)
    (next ?t1 - timestep ?t2 - timestep)
    (barbara-available ?t - timestep)
    (move-rem ?m - minute)
    (meet-rem ?m - minute)
    (dec ?m1 - minute ?m2 - minute)
  )

  (:action wait-1
    :parameters (?a - agent ?t1 - timestep ?t2 - timestep)
    :precondition (and (free ?a) (now ?t1) (next ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action begin-move-northbeach-to-alamosquare
    :parameters (?a - agent ?t - timestep)
    :precondition (and (free ?a) (now ?t) (at ?a northbeach))
    :effect (and
      (not (free ?a))
      (in-transit ?a northbeach alamosquare)
      (not (at ?a northbeach))
      (move-rem m016)
    )
  )

  (:action begin-move-alamosquare-to-northbeach
    :parameters (?a - agent ?t - timestep)
    :precondition (and (free ?a) (now ?t) (at ?a alamosquare))
    :effect (and
      (not (free ?a))
      (in-transit ?a alamosquare northbeach)
      (not (at ?a alamosquare))
      (move-rem m015)
    )
  )

  (:action move-step
    :parameters (?a - agent ?l1 - location ?l2 - location ?m1 - minute ?m2 - minute ?t1 - timestep ?t2 - timestep)
    :precondition (and
      (in-transit ?a ?l1 ?l2)
      (move-rem ?m1)
      (dec ?m1 ?m2)
      (now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
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
    :parameters (?a - agent ?t - timestep)
    :precondition (and
      (free ?a)
      (now ?t)
      (at ?a alamosquare)
      (barbara-available ?t)
    )
    :effect (and
      (not (free ?a))
      (meeting ?a barbara)
      (meet-rem m090)
    )
  )

  (:action meeting-step
    :parameters (?a - agent ?m1 - minute ?m2 - minute ?t1 - timestep ?t2 - timestep)
    :precondition (and
      (meeting ?a barbara)
      (meet-rem ?m1)
      (dec ?m1 ?m2)
      (now ?t1)
      (next ?t1 ?t2)
      (barbara-available ?t1)
      (at ?a alamosquare)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (meet-rem ?m1))
      (meet-rem ?m2)
    )
  )

  (:action finish-meeting-barbara
    :parameters (?a - agent)
    :precondition (and
      (meeting ?a barbara)
      (meet-rem m000)
      (at ?a alamosquare)
    )
    :effect (and
      (not (meeting ?a barbara))
      (not (meet-rem m000))
      (free ?a)
      (met-barbara)
    )
  )
)