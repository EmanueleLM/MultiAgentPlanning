(define (domain san_francisco_betty_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meet_step
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (travel_18 ?from - location ?to - location)
    (travel_17 ?from - location ?to - location)
    (after_18 ?t1 - time ?t2 - time)
    (after_17 ?t1 - time ?t2 - time)
    (available ?p - person ?t - time)
    (meeting_progress ?m - meet_step)
    (next_meet_step ?m1 - meet_step ?m2 - meet_step)
    (meeting_started)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_started))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_18_minutes
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_18 ?from ?to)
      (after_18 ?t1 ?t2)
      (not (meeting_started))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_17_minutes
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_17 ?from ?to)
      (after_17 ?t1 ?t2)
      (not (meeting_started))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_betty_first_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at north_beach)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available betty ?t1)
      (meeting_progress m0)
      (next_meet_step m0 m1)
      (not (meeting_started))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress m0))
      (meeting_progress m1)
      (meeting_started)
    )
  )

  (:action meet_betty_continue
    :parameters (?t1 - time ?t2 - time ?m1 - meet_step ?m2 - meet_step)
    :precondition (and
      (at north_beach)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available betty ?t1)
      (meeting_started)
      (meeting_progress ?m1)
      (next_meet_step ?m1 ?m2)
      (not (meeting_progress m75))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?m1))
      (meeting_progress ?m2)
    )
  )
)