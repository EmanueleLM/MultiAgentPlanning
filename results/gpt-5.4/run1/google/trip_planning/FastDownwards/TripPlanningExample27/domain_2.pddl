(define (domain trip_planning_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited_day ?d - day)
    (day_in_city ?d - day ?c - city)
    (santorini_window ?d - day)
    (relatives_visited)
    (need_amsterdam_1)
    (need_amsterdam_2)
    (need_amsterdam_3)
    (need_amsterdam_4)
    (need_amsterdam_5)
    (need_amsterdam_6)
    (need_amsterdam_7)
    (need_istanbul_1)
    (need_istanbul_2)
    (need_istanbul_3)
    (need_istanbul_4)
    (need_istanbul_5)
    (need_istanbul_6)
    (need_santorini_1)
    (need_santorini_2)
    (need_santorini_3)
    (done)
  )

  (:action start_day1_amsterdam
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_day day_1))
      (not (at amsterdam))
      (not (at istanbul))
      (not (at santorini))
      (need_amsterdam_1)
    )
    :effect (and
      (at amsterdam)
      (visited_day day_1)
      (day_in_city day_1 amsterdam)
      (not (need_amsterdam_1))
    )
  )

  (:action start_day1_istanbul
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_day day_1))
      (not (at amsterdam))
      (not (at istanbul))
      (not (at santorini))
      (need_istanbul_1)
    )
    :effect (and
      (at istanbul)
      (visited_day day_1)
      (day_in_city day_1 istanbul)
      (not (need_istanbul_1))
    )
  )

  (:action start_day1_santorini
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_day day_1))
      (not (at amsterdam))
      (not (at istanbul))
      (not (at santorini))
      (need_santorini_1)
    )
    :effect (and
      (at santorini)
      (visited_day day_1)
      (day_in_city day_1 santorini)
      (not (need_santorini_1))
    )
  )

  (:action stay_amsterdam_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (need_amsterdam_2)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_2))
    )
  )

  (:action stay_amsterdam_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (not (need_amsterdam_2))
      (need_amsterdam_3)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_3))
    )
  )

  (:action stay_amsterdam_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (not (need_amsterdam_3))
      (need_amsterdam_4)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_4))
    )
  )

  (:action stay_amsterdam_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (not (need_amsterdam_4))
      (need_amsterdam_5)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_5))
    )
  )

  (:action stay_amsterdam_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (not (need_amsterdam_5))
      (need_amsterdam_6)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_6))
    )
  )

  (:action stay_amsterdam_6_to_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (not (visited_day ?d2))
      (not (need_amsterdam_6))
      (need_amsterdam_7)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_amsterdam_7))
    )
  )

  (:action stay_istanbul_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (not (visited_day ?d2))
      (need_istanbul_2)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_istanbul_2))
    )
  )

  (:action stay_istanbul_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (not (visited_day ?d2))
      (not (need_istanbul_2))
      (need_istanbul_3)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_istanbul_3))
    )
  )

  (:action stay_istanbul_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (not (visited_day ?d2))
      (not (need_istanbul_3))
      (need_istanbul_4)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_istanbul_4))
    )
  )

  (:action stay_istanbul_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (not (visited_day ?d2))
      (not (need_istanbul_4))
      (need_istanbul_5)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_istanbul_5))
    )
  )

  (:action stay_istanbul_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (not (visited_day ?d2))
      (not (need_istanbul_5))
      (need_istanbul_6)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_istanbul_6))
    )
  )

  (:action stay_santorini_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at santorini)
      (not (visited_day ?d2))
      (need_santorini_2)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 santorini)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_santorini_2))
    )
  )

  (:action stay_santorini_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at santorini)
      (not (visited_day ?d2))
      (not (need_santorini_2))
      (need_santorini_3)
    )
    :effect (and
      (visited_day ?d2)
      (day_in_city ?d2 santorini)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_santorini_3))
    )
  )

  (:action visit_relatives_in_santorini_day12
    :parameters ()
    :precondition (and
      (current_day day_12)
      (visited_day day_12)
      (at santorini)
      (santorini_window day_12)
      (not (relatives_visited))
    )
    :effect (relatives_visited)
  )

  (:action visit_relatives_in_santorini_day13
    :parameters ()
    :precondition (and
      (current_day day_13)
      (visited_day day_13)
      (at santorini)
      (santorini_window day_13)
      (not (relatives_visited))
    )
    :effect (relatives_visited)
  )

  (:action visit_relatives_in_santorini_day14
    :parameters ()
    :precondition (and
      (current_day day_14)
      (visited_day day_14)
      (at santorini)
      (santorini_window day_14)
      (not (relatives_visited))
    )
    :effect (relatives_visited)
  )

  (:action fly_amsterdam_to_istanbul
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (direct amsterdam istanbul)
      (not (visited_day ?d2))
      (not (at istanbul))
    )
    :effect (and
      (not (at amsterdam))
      (at istanbul)
      (visited_day ?d2)
      (day_in_city ?d2 istanbul)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_istanbul_to_amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at istanbul)
      (direct istanbul amsterdam)
      (not (visited_day ?d2))
      (not (at amsterdam))
    )
    :effect (and
      (not (at istanbul))
      (at amsterdam)
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_amsterdam_to_santorini
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at amsterdam)
      (direct amsterdam santorini)
      (not (visited_day ?d2))
      (not (at santorini))
    )
    :effect (and
      (not (at amsterdam))
      (at santorini)
      (visited_day ?d2)
      (day_in_city ?d2 santorini)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_santorini_to_amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at santorini)
      (direct santorini amsterdam)
      (not (visited_day ?d2))
      (not (at amsterdam))
    )
    :effect (and
      (not (at santorini))
      (at amsterdam)
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day day_14)
      (visited_day day_14)
      (not (need_amsterdam_1))
      (not (need_amsterdam_2))
      (not (need_amsterdam_3))
      (not (need_amsterdam_4))
      (not (need_amsterdam_5))
      (not (need_amsterdam_6))
      (not (need_amsterdam_7))
      (not (need_istanbul_1))
      (not (need_istanbul_2))
      (not (need_istanbul_3))
      (not (need_istanbul_4))
      (not (need_istanbul_5))
      (not (need_istanbul_6))
      (not (need_santorini_1))
      (not (need_santorini_2))
      (not (need_santorini_3))
      (relatives_visited)
      (not (done))
    )
    :effect (done)
  )
)