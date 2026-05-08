(define (domain san_francisco_jeffrey_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent location time meeting_step
  )

  (:constants
    the_castro golden_gate_park - location
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (meeting_jeffrey)
    (meeting_progress ?m - meeting_step)
    (next_time ?t1 - time ?t2 - time)
    (available_jeffrey ?t - time)
    (travel_reaches ?from - location ?to - location ?t1 - time ?t2 - time)
    (next_meeting_step ?m1 - meeting_step ?m2 - meeting_step)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (current_time ?t1)
      (travel_reaches ?from ?to ?t1 ?t2)
      (not (meeting_jeffrey))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?a - agent ?t - time)
    :precondition (and
      (at ?a golden_gate_park)
      (current_time ?t)
      (available_jeffrey ?t)
      (not (meeting_jeffrey))
    )
    :effect (and
      (meeting_jeffrey)
    )
  )

  (:action advance_meeting_minute
    :parameters (?a - agent ?t1 - time ?t2 - time ?m1 - meeting_step ?m2 - meeting_step)
    :precondition (and
      (meeting_jeffrey)
      (at ?a golden_gate_park)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available_jeffrey ?t1)
      (meeting_progress ?m1)
      (next_meeting_step ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?m1))
      (meeting_progress ?m2)
    )
  )
)