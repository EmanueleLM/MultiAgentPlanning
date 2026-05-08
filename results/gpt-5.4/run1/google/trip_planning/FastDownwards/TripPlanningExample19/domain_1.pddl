(define (domain europe_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (trip_not_started)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (current_city ?c - city)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (meeting_satisfied)
    (brussels_count_0)
    (brussels_count_1)
    (brussels_count_2)
    (valencia_count_0)
    (valencia_count_1)
    (valencia_count_2)
    (valencia_count_3)
    (nice_count_0)
    (nice_count_1)
    (nice_count_2)
    (nice_count_3)
    (nice_count_4)
    (nice_count_5)
    (nice_count_6)
  )

  (:action start_in_brussels
    :parameters ()
    :precondition (and
      (trip_not_started)
      (brussels_count_0)
      (valencia_count_0)
      (nice_count_0)
    )
    :effect (and
      (not (trip_not_started))
      (current_day day_1)
      (current_city brussels)
      (visited_on brussels day_1)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (trip_not_started)
      (brussels_count_0)
      (valencia_count_0)
      (nice_count_0)
    )
    :effect (and
      (not (trip_not_started))
      (current_day day_1)
      (current_city valencia)
      (visited_on valencia day_1)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action start_in_nice
    :parameters ()
    :precondition (and
      (trip_not_started)
      (brussels_count_0)
      (valencia_count_0)
      (nice_count_0)
    )
    :effect (and
      (not (trip_not_started))
      (current_day day_1)
      (current_city nice)
      (visited_on nice day_1)
      (meeting_satisfied)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action stay_in_brussels_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (brussels_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on brussels ?d2)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action stay_in_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (brussels_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on brussels ?d2)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action stay_in_valencia_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city valencia)
      (valencia_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on valencia ?d2)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action stay_in_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city valencia)
      (valencia_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on valencia ?d2)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action stay_in_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city valencia)
      (valencia_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on valencia ?d2)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action stay_in_nice_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action stay_in_nice_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action stay_in_nice_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action stay_in_nice_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action stay_in_nice_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action stay_in_nice_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (nice_count_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_5))
      (nice_count_6)
    )
  )

  (:action fly_brussels_to_valencia_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels valencia)
      (valencia_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city valencia)
      (visited_on valencia ?d2)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action fly_brussels_to_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels valencia)
      (valencia_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city valencia)
      (visited_on valencia ?d2)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action fly_brussels_to_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels valencia)
      (valencia_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city valencia)
      (visited_on valencia ?d2)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action fly_valencia_to_brussels_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city valencia)
      (direct_flight valencia brussels)
      (brussels_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city valencia))
      (current_city brussels)
      (visited_on brussels ?d2)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action fly_valencia_to_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city valencia)
      (direct_flight valencia brussels)
      (brussels_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city valencia))
      (current_city brussels)
      (visited_on brussels ?d2)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action fly_brussels_to_nice_meeting_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_0)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action fly_brussels_to_nice_meeting_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_1)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action fly_brussels_to_nice_meeting_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_2)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action fly_brussels_to_nice_meeting_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_3)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action fly_brussels_to_nice_meeting_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_4)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action fly_brussels_to_nice_meeting_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city brussels)
      (direct_flight brussels nice)
      (nice_count_5)
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city brussels))
      (current_city nice)
      (visited_on nice ?d2)
      (meeting_satisfied)
      (not (nice_count_5))
      (nice_count_6)
    )
  )

  (:action fly_nice_to_brussels_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (direct_flight nice brussels)
      (brussels_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city nice))
      (current_city brussels)
      (visited_on brussels ?d2)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action fly_nice_to_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city nice)
      (direct_flight nice brussels)
      (brussels_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city nice))
      (current_city brussels)
      (visited_on brussels ?d2)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )
)