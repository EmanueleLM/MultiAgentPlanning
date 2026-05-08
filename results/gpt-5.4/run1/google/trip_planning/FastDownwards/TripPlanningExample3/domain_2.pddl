(define (domain trip_planning_example3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (visited ?d - day ?c - city)

    (berlin_days_0)
    (berlin_days_1)
    (berlin_days_2)
    (berlin_days_3)

    (warsaw_days_0)
    (warsaw_days_1)
    (warsaw_days_2)
    (warsaw_days_3)

    (bucharest_days_0)
    (bucharest_days_1)
    (bucharest_days_2)

    (met_friend)
    (trip_done)
  )

  (:action stay_berlin_1
    :parameters ()
    :precondition (and
      (current_day day1)
      (at berlin)
      (next_day day1 day2)
      (berlin_days_0)
      (not (visited day1 berlin))
    )
    :effect (and
      (visited day1 berlin)
      (not (current_day day1))
      (current_day day2)
      (not (berlin_days_0))
      (berlin_days_1)
    )
  )

  (:action stay_berlin_2
    :parameters ()
    :precondition (and
      (current_day day2)
      (at berlin)
      (next_day day2 day3)
      (berlin_days_1)
      (not (visited day2 berlin))
    )
    :effect (and
      (visited day2 berlin)
      (not (current_day day2))
      (current_day day3)
      (not (berlin_days_1))
      (berlin_days_2)
    )
  )

  (:action stay_berlin_3
    :parameters ()
    :precondition (and
      (current_day day3)
      (at berlin)
      (next_day day3 day4)
      (berlin_days_2)
      (not (visited day3 berlin))
    )
    :effect (and
      (visited day3 berlin)
      (not (current_day day3))
      (current_day day4)
      (not (berlin_days_2))
      (berlin_days_3)
    )
  )

  (:action stay_warsaw_1
    :parameters ()
    :precondition (and
      (current_day day1)
      (at warsaw)
      (next_day day1 day2)
      (warsaw_days_0)
      (not (visited day1 warsaw))
    )
    :effect (and
      (visited day1 warsaw)
      (not (current_day day1))
      (current_day day2)
      (not (warsaw_days_0))
      (warsaw_days_1)
    )
  )

  (:action stay_warsaw_2
    :parameters ()
    :precondition (and
      (current_day day2)
      (at warsaw)
      (next_day day2 day3)
      (warsaw_days_1)
      (not (visited day2 warsaw))
    )
    :effect (and
      (visited day2 warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (warsaw_days_1))
      (warsaw_days_2)
    )
  )

  (:action stay_warsaw_3
    :parameters ()
    :precondition (and
      (current_day day3)
      (at warsaw)
      (next_day day3 day4)
      (warsaw_days_2)
      (not (visited day3 warsaw))
    )
    :effect (and
      (visited day3 warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (warsaw_days_2))
      (warsaw_days_3)
    )
  )

  (:action stay_bucharest_day5
    :parameters ()
    :precondition (and
      (current_day day5)
      (at bucharest)
      (next_day day5 day6)
      (bucharest_days_0)
      (not (visited day5 bucharest))
    )
    :effect (and
      (visited day5 bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (bucharest_days_0))
      (bucharest_days_1)
      (met_friend)
    )
  )

  (:action stay_bucharest_day6
    :parameters ()
    :precondition (and
      (current_day day6)
      (at bucharest)
      (bucharest_days_1)
      (not (visited day6 bucharest))
    )
    :effect (and
      (visited day6 bucharest)
      (not (current_day day6))
      (not (bucharest_days_1))
      (bucharest_days_2)
      (met_friend)
      (trip_done)
    )
  )

  (:action fly_berlin_to_warsaw_day4
    :parameters ()
    :precondition (and
      (current_day day4)
      (at berlin)
      (direct_flight berlin warsaw)
      (next_day day4 day5)
      (berlin_days_3)
      (warsaw_days_0)
      (not (visited day4 warsaw))
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (visited day4 warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (warsaw_days_0))
      (warsaw_days_1)
    )
  )

  (:action fly_warsaw_to_bucharest_day4
    :parameters ()
    :precondition (and
      (current_day day4)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (next_day day4 day5)
      (warsaw_days_3)
      (bucharest_days_0)
      (not (visited day4 bucharest))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (visited day4 bucharest)
      (not (current_day day4))
      (current_day day5)
      (not (bucharest_days_0))
      (bucharest_days_1)
    )
  )

  (:action fly_warsaw_to_bucharest_day5
    :parameters ()
    :precondition (and
      (current_day day5)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (next_day day5 day6)
      (warsaw_days_3)
      (bucharest_days_0)
      (not (visited day5 bucharest))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (visited day5 bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (bucharest_days_0))
      (bucharest_days_1)
      (met_friend)
    )
  )

  (:action fly_berlin_to_warsaw_day1
    :parameters ()
    :precondition (and
      (current_day day1)
      (at berlin)
      (direct_flight berlin warsaw)
      (next_day day1 day2)
      (warsaw_days_0)
      (not (visited day1 warsaw))
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (visited day1 warsaw)
      (not (current_day day1))
      (current_day day2)
      (not (warsaw_days_0))
      (warsaw_days_1)
    )
  )

  (:action stay_warsaw_after_flight_day2
    :parameters ()
    :precondition (and
      (current_day day2)
      (at warsaw)
      (warsaw_days_1)
      (next_day day2 day3)
      (not (visited day2 warsaw))
    )
    :effect (and
      (visited day2 warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (warsaw_days_1))
      (warsaw_days_2)
    )
  )

  (:action stay_warsaw_after_flight_day3
    :parameters ()
    :precondition (and
      (current_day day3)
      (at warsaw)
      (warsaw_days_2)
      (next_day day3 day4)
      (not (visited day3 warsaw))
    )
    :effect (and
      (visited day3 warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (warsaw_days_2))
      (warsaw_days_3)
    )
  )
)