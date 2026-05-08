(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (spent ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)

    (venice_day1)
    (venice_day2)
    (venice_day3)
    (venice_day4)

    (porto_day1)
    (porto_day2)
    (porto_day3)
    (porto_day4)

    (dublin_day1)
    (dublin_day2)
    (dublin_day3)
    (dublin_day4)

    (met_friends)
    (trip_finished)
  )

  (:action stay_venice_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (not (venice_day1))
    )
    :effect (and
      (spent ?d venice)
      (venice_day1)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_0_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (not (venice_day1))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day1)
      (met_friends)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day1)
      (not (venice_day2))
    )
    :effect (and
      (spent ?d venice)
      (venice_day2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_1_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day1)
      (not (venice_day2))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day2)
      (met_friends)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day2)
      (not (venice_day3))
    )
    :effect (and
      (spent ?d venice)
      (venice_day3)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_2_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day2)
      (not (venice_day3))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day3)
      (met_friends)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day3)
      (not (venice_day4))
    )
    :effect (and
      (spent ?d venice)
      (venice_day4)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_venice_3_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (venice_day3)
      (not (venice_day4))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day4)
      (met_friends)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_porto_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (not (porto_day1))
    )
    :effect (and
      (spent ?d porto)
      (porto_day1)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_porto_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (porto_day1)
      (not (porto_day2))
    )
    :effect (and
      (spent ?d porto)
      (porto_day2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_porto_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (porto_day2)
      (not (porto_day3))
    )
    :effect (and
      (spent ?d porto)
      (porto_day3)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_porto_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (porto_day3)
      (not (porto_day4))
    )
    :effect (and
      (spent ?d porto)
      (porto_day4)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_dublin_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (not (dublin_day1))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day1)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_dublin_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (dublin_day1)
      (not (dublin_day2))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_dublin_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (dublin_day2)
      (not (dublin_day3))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day3)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_dublin_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (dublin_day3)
      (not (dublin_day4))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day4)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (not (venice_day1))
    )
    :effect (and
      (spent ?d venice)
      (venice_day1)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_0_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (not (venice_day1))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day1)
      (met_friends)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day1)
      (not (venice_day2))
    )
    :effect (and
      (spent ?d venice)
      (venice_day2)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_1_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day1)
      (not (venice_day2))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day2)
      (met_friends)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day2)
      (not (venice_day3))
    )
    :effect (and
      (spent ?d venice)
      (venice_day3)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_2_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day2)
      (not (venice_day3))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day3)
      (met_friends)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day3)
      (not (venice_day4))
    )
    :effect (and
      (spent ?d venice)
      (venice_day4)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_dublin_3_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (direct_flight venice dublin)
      (venice_day3)
      (not (venice_day4))
      (not (met_friends))
    )
    :effect (and
      (spent ?d venice)
      (venice_day4)
      (met_friends)
      (not (at venice))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_venice_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin venice)
      (not (dublin_day1))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day1)
      (not (at dublin))
      (at venice)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_venice_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin venice)
      (dublin_day1)
      (not (dublin_day2))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day2)
      (not (at dublin))
      (at venice)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_venice_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin venice)
      (dublin_day2)
      (not (dublin_day3))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day3)
      (not (at dublin))
      (at venice)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_venice_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin venice)
      (dublin_day3)
      (not (dublin_day4))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day4)
      (not (at dublin))
      (at venice)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_porto_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin porto)
      (not (dublin_day1))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day1)
      (not (at dublin))
      (at porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_porto_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin porto)
      (dublin_day1)
      (not (dublin_day2))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day2)
      (not (at dublin))
      (at porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_porto_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin porto)
      (dublin_day2)
      (not (dublin_day3))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day3)
      (not (at dublin))
      (at porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_dublin_to_porto_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at dublin)
      (direct_flight dublin porto)
      (dublin_day3)
      (not (dublin_day4))
    )
    :effect (and
      (spent ?d dublin)
      (dublin_day4)
      (not (at dublin))
      (at porto)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_porto_to_dublin_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (direct_flight porto dublin)
      (not (porto_day1))
    )
    :effect (and
      (spent ?d porto)
      (porto_day1)
      (not (at porto))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_porto_to_dublin_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (direct_flight porto dublin)
      (porto_day1)
      (not (porto_day2))
    )
    :effect (and
      (spent ?d porto)
      (porto_day2)
      (not (at porto))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_porto_to_dublin_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (direct_flight porto dublin)
      (porto_day2)
      (not (porto_day3))
    )
    :effect (and
      (spent ?d porto)
      (porto_day3)
      (not (at porto))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_porto_to_dublin_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at porto)
      (direct_flight porto dublin)
      (porto_day3)
      (not (porto_day4))
    )
    :effect (and
      (spent ?d porto)
      (porto_day4)
      (not (at porto))
      (at dublin)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action final_spend_venice_0
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (not (venice_day1))
    )
    :effect (and
      (spent day10 venice)
      (venice_day1)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_0_meet
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (not (venice_day1))
      (not (met_friends))
    )
    :effect (and
      (spent day10 venice)
      (venice_day1)
      (met_friends)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_1
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day1)
      (not (venice_day2))
    )
    :effect (and
      (spent day10 venice)
      (venice_day2)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_1_meet
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day1)
      (not (venice_day2))
      (not (met_friends))
    )
    :effect (and
      (spent day10 venice)
      (venice_day2)
      (met_friends)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_2
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day2)
      (not (venice_day3))
    )
    :effect (and
      (spent day10 venice)
      (venice_day3)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_2_meet
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day2)
      (not (venice_day3))
      (not (met_friends))
    )
    :effect (and
      (spent day10 venice)
      (venice_day3)
      (met_friends)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_3
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day3)
      (not (venice_day4))
    )
    :effect (and
      (spent day10 venice)
      (venice_day4)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_venice_3_meet
    :parameters ()
    :precondition (and
      (current_day day10)
      (at venice)
      (venice_day3)
      (not (venice_day4))
      (not (met_friends))
    )
    :effect (and
      (spent day10 venice)
      (venice_day4)
      (met_friends)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_porto_0
    :parameters ()
    :precondition (and
      (current_day day10)
      (at porto)
      (not (porto_day1))
    )
    :effect (and
      (spent day10 porto)
      (porto_day1)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_porto_1
    :parameters ()
    :precondition (and
      (current_day day10)
      (at porto)
      (porto_day1)
      (not (porto_day2))
    )
    :effect (and
      (spent day10 porto)
      (porto_day2)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_porto_2
    :parameters ()
    :precondition (and
      (current_day day10)
      (at porto)
      (porto_day2)
      (not (porto_day3))
    )
    :effect (and
      (spent day10 porto)
      (porto_day3)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_porto_3
    :parameters ()
    :precondition (and
      (current_day day10)
      (at porto)
      (porto_day3)
      (not (porto_day4))
    )
    :effect (and
      (spent day10 porto)
      (porto_day4)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_dublin_0
    :parameters ()
    :precondition (and
      (current_day day10)
      (at dublin)
      (not (dublin_day1))
    )
    :effect (and
      (spent day10 dublin)
      (dublin_day1)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_dublin_1
    :parameters ()
    :precondition (and
      (current_day day10)
      (at dublin)
      (dublin_day1)
      (not (dublin_day2))
    )
    :effect (and
      (spent day10 dublin)
      (dublin_day2)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_dublin_2
    :parameters ()
    :precondition (and
      (current_day day10)
      (at dublin)
      (dublin_day2)
      (not (dublin_day3))
    )
    :effect (and
      (spent day10 dublin)
      (dublin_day3)
      (not (current_day day10))
      (trip_finished)
    )
  )

  (:action final_spend_dublin_3
    :parameters ()
    :precondition (and
      (current_day day10)
      (at dublin)
      (dublin_day3)
      (not (dublin_day4))
    )
    :effect (and
      (spent day10 dublin)
      (dublin_day4)
      (not (current_day day10))
      (trip_finished)
    )
  )
)