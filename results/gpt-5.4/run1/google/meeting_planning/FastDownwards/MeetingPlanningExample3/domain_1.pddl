(define (domain meet_barbara_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    friend
    time
  )

  (:constants
    barbara - friend
    bayview golden_gate_park - location
  )

  (:predicates
    (connected ?from - location ?to - location)
    (next ?t1 - time ?t2 - time)
    (friend_at ?f - friend ?l - location)
    (barbara_available_interval_start ?t - time)
    (at ?l - location)
    (current_time ?t - time)
    (meeting ?f - friend)
    (met_30 ?f - friend)
    (met_60 ?f - friend)
    (met_90 ?f - friend)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
      (not (meeting barbara))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (next ?t1 ?t2)
      (not (meeting barbara))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_30
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (friend_at barbara golden_gate_park)
      (current_time ?t1)
      (next ?t1 ?t2)
      (barbara_available_interval_start ?t1)
      (not (meeting barbara))
      (not (met_30 barbara))
      (not (met_60 barbara))
      (not (met_90 barbara))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (meeting barbara)
      (met_30 barbara)
    )
  )

  (:action extend_meeting_to_60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (friend_at barbara golden_gate_park)
      (current_time ?t1)
      (next ?t1 ?t2)
      (barbara_available_interval_start ?t1)
      (meeting barbara)
      (met_30 barbara)
      (not (met_60 barbara))
      (not (met_90 barbara))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_60 barbara)
    )
  )

  (:action extend_meeting_to_90
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at golden_gate_park)
      (friend_at barbara golden_gate_park)
      (current_time ?t1)
      (next ?t1 ?t2)
      (barbara_available_interval_start ?t1)
      (meeting barbara)
      (met_60 barbara)
      (not (met_90 barbara))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_90 barbara)
    )
  )
)