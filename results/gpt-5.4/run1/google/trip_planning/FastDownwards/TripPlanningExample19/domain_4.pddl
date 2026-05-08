(define (domain trip_planning_example19)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    brussels valencia nice - city
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (day_in_meeting_window ?d - day)
    (visited ?c - city)
    (stay_done ?d - day)
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
    (friends_met)
  )

  (:action start_in_brussels
    :parameters ()
    :precondition (and
      (today day_1)
      (not (stay_done day_1))
    )
    :effect (and
      (at brussels)
      (visited brussels)
      (stay_done day_1)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (today day_1)
      (not (stay_done day_1))
    )
    :effect (and
      (at valencia)
      (visited valencia)
      (stay_done day_1)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action start_in_nice
    :parameters ()
    :precondition (and
      (today day_1)
      (not (stay_done day_1))
    )
    :effect (and
      (at nice)
      (visited nice)
      (stay_done day_1)
      (not (nice_count_0))
      (nice_count_1)
      (friends_met)
    )
  )

  (:action stay_brussels_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at brussels)
      (not (stay_done ?d2))
      (brussels_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action stay_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (not (stay_done ?d2))
      (valencia_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action stay_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (not (stay_done ?d2))
      (valencia_count_2)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action stay_nice_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action stay_nice_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_2)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action stay_nice_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_3)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action stay_nice_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_4)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action stay_nice_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_5)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_5))
      (nice_count_6)
    )
  )

  (:action fly_brussels_to_valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at brussels)
      (flight brussels valencia)
      (not (stay_done ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (at brussels))
      (at valencia)
      (visited valencia)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action fly_valencia_to_brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (flight valencia brussels)
      (not (stay_done ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (at valencia))
      (at brussels)
      (visited brussels)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action fly_brussels_to_nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at brussels)
      (flight brussels nice)
      (not (stay_done ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (at brussels))
      (at nice)
      (visited nice)
      (not (nice_count_0))
      (nice_count_1)
      (friends_met)
    )
  )

  (:action fly_nice_to_brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (flight nice brussels)
      (not (stay_done ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (at nice))
      (at brussels)
      (visited brussels)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )
)