(define (domain san_francisco_meet_jeffrey)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    time
    meet_stage
  )

  (:constants
    the_castro golden_gate_park - location
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (advance_11 ?t1 - time ?t2 - time)
    (advance_13 ?t1 - time ?t2 - time)
    (route_11 ?from - location ?to - location)
    (route_13 ?from - location ?to - location)
    (jeffrey_available ?t - time)
    (meeting_progress ?m - meet_stage)
    (next_meet_stage ?m1 - meet_stage ?m2 - meet_stage)
  )

  (:action travel_11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (route_11 ?from ?to)
      (advance_11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_13
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (route_13 ?from ?to)
      (advance_13 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_jeffrey_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meet_stage ?m2 - meet_stage)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress ?m1)
      (next_meet_stage ?m1 ?m2)
      (at golden_gate_park)
      (jeffrey_available ?t1)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?m1))
      (meeting_progress ?m2)
    )
  )
)