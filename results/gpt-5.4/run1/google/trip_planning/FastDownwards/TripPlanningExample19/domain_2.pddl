(define (domain europe_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (total_days_0)
    (total_days_1)
    (total_days_2)
    (total_days_3)
    (total_days_4)
    (total_days_5)
    (total_days_6)
    (total_days_7)
    (total_days_8)
    (total_days_9)
    (brussels_days_0)
    (brussels_days_1)
    (brussels_days_2)
    (valencia_days_0)
    (valencia_days_1)
    (valencia_days_2)
    (valencia_days_3)
    (nice_days_0)
    (nice_days_1)
    (nice_days_2)
    (nice_days_3)
    (nice_days_4)
    (nice_days_5)
    (nice_days_6)
    (friends_met)
  )

  (:action start_in_brussels
    :parameters ()
    :precondition (and
      (total_days_0)
      (brussels_days_0)
      (valencia_days_0)
      (nice_days_0)
    )
    :effect (and
      (at brussels)
      (current_day day_1)
      (not (total_days_0))
      (total_days_1)
      (not (brussels_days_0))
      (brussels_days_1)
    )
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (total_days_0)
      (brussels_days_0)
      (valencia_days_0)
      (nice_days_0)
    )
    :effect (and
      (at valencia)
      (current_day day_1)
      (not (total_days_0))
      (total_days_1)
      (not (valencia_days_0))
      (valencia_days_1)
    )
  )

  (:action start_in_nice
    :parameters ()
    :precondition (and
      (total_days_0)
      (brussels_days_0)
      (valencia_days_0)
      (nice_days_0)
    )
    :effect (and
      (at nice)
      (current_day day_1)
      (not (total_days_0))
      (total_days_1)
      (not (nice_days_0))
      (nice_days_1)
      (friends_met)
    )
  )

  (:action stay_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_1)
      (brussels_days_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (brussels_days_1))
      (brussels_days_2)
    )
  )

  (:action stay_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_1)
      (valencia_days_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (valencia_days_1))
      (valencia_days_2)
    )
  )

  (:action stay_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_2)
      (valencia_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_2))
      (total_days_3)
      (not (valencia_days_2))
      (valencia_days_3)
    )
  )

  (:action stay_nice_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_1)
      (nice_days_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (nice_days_1))
      (nice_days_2)
      (friends_met)
    )
  )

  (:action stay_nice_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_2)
      (nice_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_2))
      (total_days_3)
      (not (nice_days_2))
      (nice_days_3)
      (friends_met)
    )
  )

  (:action stay_nice_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_3)
      (nice_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_3))
      (total_days_4)
      (not (nice_days_3))
      (nice_days_4)
      (friends_met)
    )
  )

  (:action stay_nice_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_4)
      (nice_days_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_4))
      (total_days_5)
      (not (nice_days_4))
      (nice_days_5)
      (friends_met)
    )
  )

  (:action stay_nice_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_5)
      (nice_days_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_5))
      (total_days_6)
      (not (nice_days_5))
      (nice_days_6)
      (friends_met)
    )
  )

  (:action fly_brussels_to_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels valencia)
      (total_days_1)
      (valencia_days_1)
    )
    :effect (and
      (not (at brussels))
      (at valencia)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (valencia_days_1))
      (valencia_days_2)
    )
  )

  (:action fly_brussels_to_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels valencia)
      (total_days_2)
      (valencia_days_2)
    )
    :effect (and
      (not (at brussels))
      (at valencia)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_2))
      (total_days_3)
      (not (valencia_days_2))
      (valencia_days_3)
    )
  )

  (:action fly_valencia_to_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (direct_flight valencia brussels)
      (total_days_1)
      (brussels_days_1)
    )
    :effect (and
      (not (at valencia))
      (at brussels)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (brussels_days_1))
      (brussels_days_2)
    )
  )

  (:action fly_brussels_to_nice_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels nice)
      (total_days_1)
      (nice_days_1)
    )
    :effect (and
      (not (at brussels))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (nice_days_1))
      (nice_days_2)
      (friends_met)
    )
  )

  (:action fly_brussels_to_nice_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels nice)
      (total_days_2)
      (nice_days_2)
    )
    :effect (and
      (not (at brussels))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_2))
      (total_days_3)
      (not (nice_days_2))
      (nice_days_3)
      (friends_met)
    )
  )

  (:action fly_brussels_to_nice_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels nice)
      (total_days_3)
      (nice_days_3)
    )
    :effect (and
      (not (at brussels))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_3))
      (total_days_4)
      (not (nice_days_3))
      (nice_days_4)
      (friends_met)
    )
  )

  (:action fly_brussels_to_nice_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels nice)
      (total_days_4)
      (nice_days_4)
    )
    :effect (and
      (not (at brussels))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_4))
      (total_days_5)
      (not (nice_days_4))
      (nice_days_5)
      (friends_met)
    )
  )

  (:action fly_brussels_to_nice_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (direct_flight brussels nice)
      (total_days_5)
      (nice_days_5)
    )
    :effect (and
      (not (at brussels))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_5))
      (total_days_6)
      (not (nice_days_5))
      (nice_days_6)
      (friends_met)
    )
  )

  (:action fly_nice_to_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (direct_flight nice brussels)
      (total_days_1)
      (brussels_days_1)
    )
    :effect (and
      (not (at nice))
      (at brussels)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_1))
      (total_days_2)
      (not (brussels_days_1))
      (brussels_days_2)
    )
  )

  (:action advance_after_brussels_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_2)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_2))
      (total_days_3)
    )
  )

  (:action advance_after_brussels_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_3)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_3))
      (total_days_4)
    )
  )

  (:action advance_after_brussels_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_4)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_4))
      (total_days_5)
    )
  )

  (:action advance_after_brussels_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_5)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_5))
      (total_days_6)
    )
  )

  (:action advance_after_brussels_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_6)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_6))
      (total_days_7)
    )
  )

  (:action advance_after_brussels_7_8
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_7)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_7))
      (total_days_8)
    )
  )

  (:action advance_after_brussels_8_9
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at brussels)
      (total_days_8)
      (brussels_days_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_8))
      (total_days_9)
    )
  )

  (:action advance_after_valencia_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_3)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_3))
      (total_days_4)
    )
  )

  (:action advance_after_valencia_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_4)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_4))
      (total_days_5)
    )
  )

  (:action advance_after_valencia_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_5)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_5))
      (total_days_6)
    )
  )

  (:action advance_after_valencia_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_6)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_6))
      (total_days_7)
    )
  )

  (:action advance_after_valencia_7_8
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_7)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_7))
      (total_days_8)
    )
  )

  (:action advance_after_valencia_8_9
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (total_days_8)
      (valencia_days_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_8))
      (total_days_9)
    )
  )

  (:action advance_after_nice_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_6)
      (nice_days_6)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_6))
      (total_days_7)
    )
  )

  (:action advance_after_nice_7_8
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_7)
      (nice_days_6)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_7))
      (total_days_8)
    )
  )

  (:action advance_after_nice_8_9
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (total_days_8)
      (nice_days_6)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (total_days_8))
      (total_days_9)
    )
  )
)