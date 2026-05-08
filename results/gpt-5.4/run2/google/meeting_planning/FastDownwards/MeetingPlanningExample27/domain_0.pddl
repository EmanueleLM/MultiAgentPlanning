(define (domain meet_margaret_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    person
    traveler friend - person
    location
    timepoint
  )

  (:predicates
    (at ?p - person ?l - location)
    (friend_at ?f - friend ?l - location)
    (current_time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (available ?f - friend ?t - timepoint)
    (connected_6 ?from - location ?to - location)
    (connected_7 ?from - location ?to - location)
    (plus_6 ?t1 - timepoint ?t2 - timepoint)
    (plus_7 ?t1 - timepoint ?t2 - timepoint)
    (meeting_stage_0)
    (meeting_stage_1)
    (meeting_stage_2)
    (meeting_stage_3)
    (meeting_stage_4)
    (meeting_stage_5)
    (meeting_stage_6)
    (meeting_stage_7)
    (meeting_stage_8)
    (meeting_stage_9)
    (meeting_stage_10)
    (meeting_stage_11)
    (meeting_stage_12)
    (meeting_stage_13)
    (meeting_stage_14)
    (meeting_stage_15)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you ?l)
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_6
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you ?from)
      (current_time ?t1)
      (connected_6 ?from ?to)
      (plus_6 ?t1 ?t2)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_7
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you ?from)
      (current_time ?t1)
      (connected_7 ?from ?to)
      (plus_7 ?t1 ?t2)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_step_0_1
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_0)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_0))
      (meeting_stage_1)
    )
  )

  (:action meet_step_1_2
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_1)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_1))
      (meeting_stage_2)
    )
  )

  (:action meet_step_2_3
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_2))
      (meeting_stage_3)
    )
  )

  (:action meet_step_3_4
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_3)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_3))
      (meeting_stage_4)
    )
  )

  (:action meet_step_4_5
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_4)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_4))
      (meeting_stage_5)
    )
  )

  (:action meet_step_5_6
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_5)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_5))
      (meeting_stage_6)
    )
  )

  (:action meet_step_6_7
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_6)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_6))
      (meeting_stage_7)
    )
  )

  (:action meet_step_7_8
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_7)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_7))
      (meeting_stage_8)
    )
  )

  (:action meet_step_8_9
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_8)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_8))
      (meeting_stage_9)
    )
  )

  (:action meet_step_9_10
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_9)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_9))
      (meeting_stage_10)
    )
  )

  (:action meet_step_10_11
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_10)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_10))
      (meeting_stage_11)
    )
  )

  (:action meet_step_11_12
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_11)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_11))
      (meeting_stage_12)
    )
  )

  (:action meet_step_12_13
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_12)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_12))
      (meeting_stage_13)
    )
  )

  (:action meet_step_13_14
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_13)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_13))
      (meeting_stage_14)
    )
  )

  (:action meet_step_14_15
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at you pacific_heights)
      (friend_at margaret pacific_heights)
      (current_time ?t1)
      (next ?t1 ?t2)
      (available margaret ?t1)
      (meeting_stage_14)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_14))
      (meeting_stage_15)
    )
  )
)