(define (domain meet_mary_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    traveler friend - agent
    location
    time
    meet_step
  )

  (:predicates
    (at ?a - agent ?l - location)
    (connected_11 ?from - location ?to - location)
    (connected_12 ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (plus_11 ?t1 - time ?t2 - time)
    (plus_12 ?t1 - time ?t2 - time)
    (mary_available ?t - time)
    (meeting_progress ?m - meet_step)
    (next_meet_step ?m1 - meet_step ?m2 - meet_step)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at you ?from)
      (connected_11 ?from ?to)
      (current_time ?t1)
      (plus_11 ?t1 ?t2)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at you ?from)
      (connected_12 ?from ?to)
      (current_time ?t1)
      (plus_12 ?t1 ?t2)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_mary_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meet_step ?m2 - meet_step)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (mary_available ?t1)
      (at you marina_district)
      (at mary marina_district)
      (meeting_progress ?m1)
      (next_meet_step ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?m1))
      (meeting_progress ?m2)
    )
  )
)