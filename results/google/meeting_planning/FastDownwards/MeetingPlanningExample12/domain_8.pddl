(define (domain MeetingPlanningExample12-strips)
  (:requirements :strips :typing)
  (:types
    agent friend location timestep minute
  )
  (:constants
    northbeach alamosquare - location
    barbara - friend
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
    (dur-nb-as ?m - minute)
    (dur-as-nb ?m - minute)
    (is-zero ?m - minute)
    (meet-minimum ?m - minute)
  )

  (:action wait-1
    :parameters (?a - agent ?t1 - timestep ?t2 - timestep)
    :precondition (and (free ?a) (now ?t1) (next ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action begin-move-northbeach-to-alamosquare
    :parameters (?a - agent ?t - timestep ?m - minute)
    :precondition (and (free ?a) (now ?t) (at ?a northbeach) (dur-nb-as ?m))
    :effect (and
      (not (free ?a))
      (in-transit ?a northbeach alamosquare)
      (not (at ?a northbeach))
      (move-rem ?m)
    )
  )

  (:action begin-move-alamosquare-to-northbeach
    :parameters (?a - agent ?t - timestep ?m - minute)
    :precondition (and (free ?a) (now ?t) (at ?a alamosquare) (dur-as-nb ?m))
    :effect (and
      (not (free ?a))
      (in-transit ?a alamosquare northbeach)
      (not (at ?a alamosquare))
      (move-rem ?m)
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
    :parameters (?a - agent ?l1 - location ?l2 - location ?z - minute)
    :precondition (and
      (in-transit ?a ?l1 ?l2)
      (move-rem ?z)
      (is-zero ?z)
    )
    :effect (and
      (not (in-transit ?a ?l1 ?l2))
      (not (move-rem ?z))
      (at ?a ?l2)
      (free ?a)
    )
  )

  (:action start-meeting-barbara
    :parameters (?a - agent ?t - timestep ?m - minute)
    :precondition (and
      (free ?a)
      (now ?t)
      (at ?a alamosquare)
      (barbara-available ?t)
      (meet-minimum ?m)
    )
    :effect (and
      (not (free ?a))
      (meeting ?a barbara)
      (meet-rem ?m)
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
    :parameters (?a - agent ?z - minute)
    :precondition (and
      (meeting ?a barbara)
      (meet-rem ?z)
      (is-zero ?z)
      (at ?a alamosquare)
    )
    :effect (and
      (not (meeting ?a barbara))
      (not (meet-rem ?z))
      (free ?a)
      (met-barbara)
    )
  )
)