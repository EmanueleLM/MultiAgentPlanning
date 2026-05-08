(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count_b count_v count_n)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)

    (visited ?d - day ?c - city)

    (brussels_days ?b - count_b)
    (valencia_days ?v - count_v)
    (nice_days ?n - count_n)

    (next_b ?b1 - count_b ?b2 - count_b)
    (next_v ?v1 - count_v ?v2 - count_v)
    (next_n ?n1 - count_n ?n2 - count_n)

    (friend_window ?d - day)
    (met_friends)

    (trip_complete)
  )

  (:action stay_brussels
    :parameters (?d - day ?d2 - day ?b1 - count_b ?b2 - count_b ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at brussels)
      (brussels_days ?b1)
      (next_b ?b1 ?b2)
    )
    :effect (and
      (visited ?d brussels)
      (not (current_day ?d))
      (current_day ?d2)
      (not (brussels_days ?b1))
      (brussels_days ?b2)
    )
  )

  (:action fly_to_brussels
    :parameters (?d - day ?d2 - day ?b1 - count_b ?b2 - count_b ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (not (at brussels))
      (direct ?from brussels)
      (brussels_days ?b1)
      (next_b ?b1 ?b2)
    )
    :effect (and
      (visited ?d brussels)
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at brussels)
      (not (brussels_days ?b1))
      (brussels_days ?b2)
    )
  )

  (:action stay_valencia
    :parameters (?d - day ?d2 - day ?v1 - count_v ?v2 - count_v ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at valencia)
      (valencia_days ?v1)
      (next_v ?v1 ?v2)
    )
    :effect (and
      (visited ?d valencia)
      (not (current_day ?d))
      (current_day ?d2)
      (not (valencia_days ?v1))
      (valencia_days ?v2)
    )
  )

  (:action fly_to_valencia
    :parameters (?d - day ?d2 - day ?v1 - count_v ?v2 - count_v ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (not (at valencia))
      (direct ?from valencia)
      (valencia_days ?v1)
      (next_v ?v1 ?v2)
    )
    :effect (and
      (visited ?d valencia)
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at valencia)
      (not (valencia_days ?v1))
      (valencia_days ?v2)
    )
  )

  (:action stay_nice
    :parameters (?d - day ?d2 - day ?n1 - count_n ?n2 - count_n ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
    )
  )

  (:action stay_nice_window
    :parameters (?d - day ?d2 - day ?n1 - count_n ?n2 - count_n ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice)
      (friend_window ?d)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
    )
  )

  (:action fly_to_nice
    :parameters (?d - day ?d2 - day ?n1 - count_n ?n2 - count_n ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (not (at nice))
      (direct ?from nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at nice)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
    )
  )

  (:action fly_to_nice_window
    :parameters (?d - day ?d2 - day ?n1 - count_n ?n2 - count_n ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (not (at nice))
      (friend_window ?d)
      (direct ?from nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at nice)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
    )
  )

  (:action finish_in_brussels
    :parameters (?d - day ?b1 - count_b ?b2 - count_b ?c - city)
    :precondition (and
      (current_day ?d)
      (at brussels)
      (brussels_days ?b1)
      (next_b ?b1 ?b2)
    )
    :effect (and
      (visited ?d brussels)
      (not (current_day ?d))
      (not (brussels_days ?b1))
      (brussels_days ?b2)
      (trip_complete)
    )
  )

  (:action finish_in_brussels_from_flight
    :parameters (?d - day ?b1 - count_b ?b2 - count_b ?from - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (not (at brussels))
      (direct ?from brussels)
      (brussels_days ?b1)
      (next_b ?b1 ?b2)
    )
    :effect (and
      (visited ?d brussels)
      (not (current_day ?d))
      (not (at ?from))
      (at brussels)
      (not (brussels_days ?b1))
      (brussels_days ?b2)
      (trip_complete)
    )
  )

  (:action finish_in_valencia
    :parameters (?d - day ?v1 - count_v ?v2 - count_v ?c - city)
    :precondition (and
      (current_day ?d)
      (at valencia)
      (valencia_days ?v1)
      (next_v ?v1 ?v2)
    )
    :effect (and
      (visited ?d valencia)
      (not (current_day ?d))
      (not (valencia_days ?v1))
      (valencia_days ?v2)
      (trip_complete)
    )
  )

  (:action finish_in_valencia_from_flight
    :parameters (?d - day ?v1 - count_v ?v2 - count_v ?from - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (not (at valencia))
      (direct ?from valencia)
      (valencia_days ?v1)
      (next_v ?v1 ?v2)
    )
    :effect (and
      (visited ?d valencia)
      (not (current_day ?d))
      (not (at ?from))
      (at valencia)
      (not (valencia_days ?v1))
      (valencia_days ?v2)
      (trip_complete)
    )
  )

  (:action finish_in_nice
    :parameters (?d - day ?n1 - count_n ?n2 - count_n ?c - city)
    :precondition (and
      (current_day ?d)
      (at nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
      (trip_complete)
    )
  )

  (:action finish_in_nice_window
    :parameters (?d - day ?n1 - count_n ?n2 - count_n ?c - city)
    :precondition (and
      (current_day ?d)
      (at nice)
      (friend_window ?d)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
      (trip_complete)
    )
  )

  (:action finish_in_nice_from_flight
    :parameters (?d - day ?n1 - count_n ?n2 - count_n ?from - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (not (at nice))
      (direct ?from nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (not (at ?from))
      (at nice)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
      (trip_complete)
    )
  )

  (:action finish_in_nice_from_flight_window
    :parameters (?d - day ?n1 - count_n ?n2 - count_n ?from - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (not (at nice))
      (friend_window ?d)
      (direct ?from nice)
      (nice_days ?n1)
      (next_n ?n1 ?n2)
    )
    :effect (and
      (visited ?d nice)
      (not (current_day ?d))
      (not (at ?from))
      (at nice)
      (not (nice_days ?n1))
      (nice_days ?n2)
      (met_friends)
      (trip_complete)
    )
  )
)