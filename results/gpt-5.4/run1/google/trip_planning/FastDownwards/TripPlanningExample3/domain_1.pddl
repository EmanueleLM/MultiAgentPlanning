(define (domain european_trip_6_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (occupied ?d - day ?c - city)

    (b_count_0)
    (b_count_1)
    (b_count_2)

    (be_count_0)
    (be_count_1)
    (be_count_2)
    (be_count_3)

    (w_count_0)
    (w_count_1)
    (w_count_2)
    (w_count_3)

    (met_friend)
    (finished)
  )

  (:action stay_berlin_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at berlin) (next_day day1 day2) (be_count_0))
    :effect (and
      (occupied day1 berlin)
      (not (current_day day1))
      (current_day day2)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (next_day day2 day3) (be_count_0))
    :effect (and
      (occupied day2 berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (next_day day2 day3) (be_count_1))
    :effect (and
      (occupied day2 berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_1))
      (be_count_2))
  )

  (:action stay_berlin_day2_from2
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (next_day day2 day3) (be_count_2))
    :effect (and
      (occupied day2 berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_2))
      (be_count_3))
  )

  (:action stay_berlin_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (next_day day3 day4) (be_count_0))
    :effect (and
      (occupied day3 berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (next_day day3 day4) (be_count_1))
    :effect (and
      (occupied day3 berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_1))
      (be_count_2))
  )

  (:action stay_berlin_day3_from2
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (next_day day3 day4) (be_count_2))
    :effect (and
      (occupied day3 berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_2))
      (be_count_3))
  )

  (:action stay_berlin_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (next_day day4 day5) (be_count_0))
    :effect (and
      (occupied day4 berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (next_day day4 day5) (be_count_1))
    :effect (and
      (occupied day4 berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_1))
      (be_count_2))
  )

  (:action stay_berlin_day4_from2
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (next_day day4 day5) (be_count_2))
    :effect (and
      (occupied day4 berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_2))
      (be_count_3))
  )

  (:action stay_berlin_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (next_day day5 day6) (be_count_0))
    :effect (and
      (occupied day5 berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (next_day day5 day6) (be_count_1))
    :effect (and
      (occupied day5 berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_1))
      (be_count_2))
  )

  (:action stay_berlin_day5_from2
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (next_day day5 day6) (be_count_2))
    :effect (and
      (occupied day5 berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_2))
      (be_count_3))
  )

  (:action stay_berlin_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (last_day day6) (be_count_0))
    :effect (and
      (occupied day6 berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_0))
      (be_count_1))
  )

  (:action stay_berlin_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (last_day day6) (be_count_1))
    :effect (and
      (occupied day6 berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_1))
      (be_count_2))
  )

  (:action stay_berlin_day6_from2
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (last_day day6) (be_count_2))
    :effect (and
      (occupied day6 berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_2))
      (be_count_3))
  )

  (:action stay_warsaw_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at warsaw) (next_day day1 day2) (w_count_0))
    :effect (and
      (occupied day1 warsaw)
      (not (current_day day1))
      (current_day day2)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (next_day day2 day3) (w_count_0))
    :effect (and
      (occupied day2 warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (next_day day2 day3) (w_count_1))
    :effect (and
      (occupied day2 warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_1))
      (w_count_2))
  )

  (:action stay_warsaw_day2_from2
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (next_day day2 day3) (w_count_2))
    :effect (and
      (occupied day2 warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_2))
      (w_count_3))
  )

  (:action stay_warsaw_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (next_day day3 day4) (w_count_0))
    :effect (and
      (occupied day3 warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (next_day day3 day4) (w_count_1))
    :effect (and
      (occupied day3 warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_1))
      (w_count_2))
  )

  (:action stay_warsaw_day3_from2
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (next_day day3 day4) (w_count_2))
    :effect (and
      (occupied day3 warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_2))
      (w_count_3))
  )

  (:action stay_warsaw_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (next_day day4 day5) (w_count_0))
    :effect (and
      (occupied day4 warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (next_day day4 day5) (w_count_1))
    :effect (and
      (occupied day4 warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_1))
      (w_count_2))
  )

  (:action stay_warsaw_day4_from2
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (next_day day4 day5) (w_count_2))
    :effect (and
      (occupied day4 warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_2))
      (w_count_3))
  )

  (:action stay_warsaw_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (next_day day5 day6) (w_count_0))
    :effect (and
      (occupied day5 warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (next_day day5 day6) (w_count_1))
    :effect (and
      (occupied day5 warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_1))
      (w_count_2))
  )

  (:action stay_warsaw_day5_from2
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (next_day day5 day6) (w_count_2))
    :effect (and
      (occupied day5 warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_2))
      (w_count_3))
  )

  (:action stay_warsaw_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (last_day day6) (w_count_0))
    :effect (and
      (occupied day6 warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_0))
      (w_count_1))
  )

  (:action stay_warsaw_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (last_day day6) (w_count_1))
    :effect (and
      (occupied day6 warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_1))
      (w_count_2))
  )

  (:action stay_warsaw_day6_from2
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (last_day day6) (w_count_2))
    :effect (and
      (occupied day6 warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_2))
      (w_count_3))
  )

  (:action stay_bucharest_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at bucharest) (next_day day1 day2) (b_count_0))
    :effect (and
      (occupied day1 bucharest)
      (not (current_day day1))
      (current_day day2)
      (not (b_count_0))
      (b_count_1))
  )

  (:action stay_bucharest_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at bucharest) (next_day day2 day3) (b_count_0))
    :effect (and
      (occupied day2 bucharest)
      (not (current_day day2))
      (current_day day3)
      (not (b_count_0))
      (b_count_1))
  )

  (:action stay_bucharest_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at bucharest) (next_day day2 day3) (b_count_1))
    :effect (and
      (occupied day2 bucharest)
      (not (current_day day2))
      (current_day day3)
      (not (b_count_1))
      (b_count_2))
  )

  (:action stay_bucharest_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at bucharest) (next_day day3 day4) (b_count_0))
    :effect (and
      (occupied day3 bucharest)
      (not (current_day day3))
      (current_day day4)
      (not (b_count_0))
      (b_count_1))
  )

  (:action stay_bucharest_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at bucharest) (next_day day3 day4) (b_count_1))
    :effect (and
      (occupied day3 bucharest)
      (not (current_day day3))
      (current_day day4)
      (not (b_count_1))
      (b_count_2))
  )

  (:action stay_bucharest_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at bucharest) (next_day day4 day5) (b_count_0))
    :effect (and
      (occupied day4 bucharest)
      (not (current_day day4))
      (current_day day5)
      (not (b_count_0))
      (b_count_1))
  )

  (:action stay_bucharest_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at bucharest) (next_day day4 day5) (b_count_1))
    :effect (and
      (occupied day4 bucharest)
      (not (current_day day4))
      (current_day day5)
      (not (b_count_1))
      (b_count_2))
  )

  (:action stay_bucharest_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at bucharest) (next_day day5 day6) (b_count_0))
    :effect (and
      (occupied day5 bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (b_count_0))
      (b_count_1)
      (met_friend))
  )

  (:action stay_bucharest_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at bucharest) (next_day day5 day6) (b_count_1))
    :effect (and
      (occupied day5 bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (b_count_1))
      (b_count_2)
      (met_friend))
  )

  (:action stay_bucharest_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at bucharest) (last_day day6) (b_count_0))
    :effect (and
      (occupied day6 bucharest)
      (not (current_day day6))
      (finished)
      (not (b_count_0))
      (b_count_1)
      (met_friend))
  )

  (:action stay_bucharest_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at bucharest) (last_day day6) (b_count_1))
    :effect (and
      (occupied day6 bucharest)
      (not (current_day day6))
      (finished)
      (not (b_count_1))
      (b_count_2)
      (met_friend))
  )

  (:action fly_berlin_to_warsaw_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at berlin) (direct_flight berlin warsaw) (next_day day1 day2) (w_count_0))
    :effect (and
      (occupied day1 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day1))
      (current_day day2)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (direct_flight berlin warsaw) (next_day day2 day3) (w_count_0))
    :effect (and
      (occupied day2 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (direct_flight berlin warsaw) (next_day day2 day3) (w_count_1))
    :effect (and
      (occupied day2 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_berlin_to_warsaw_day2_from2
    :parameters ()
    :precondition (and (current_day day2) (at berlin) (direct_flight berlin warsaw) (next_day day2 day3) (w_count_2))
    :effect (and
      (occupied day2 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_berlin_to_warsaw_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (direct_flight berlin warsaw) (next_day day3 day4) (w_count_0))
    :effect (and
      (occupied day3 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (direct_flight berlin warsaw) (next_day day3 day4) (w_count_1))
    :effect (and
      (occupied day3 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_berlin_to_warsaw_day3_from2
    :parameters ()
    :precondition (and (current_day day3) (at berlin) (direct_flight berlin warsaw) (next_day day3 day4) (w_count_2))
    :effect (and
      (occupied day3 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_berlin_to_warsaw_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (direct_flight berlin warsaw) (next_day day4 day5) (w_count_0))
    :effect (and
      (occupied day4 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (direct_flight berlin warsaw) (next_day day4 day5) (w_count_1))
    :effect (and
      (occupied day4 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_berlin_to_warsaw_day4_from2
    :parameters ()
    :precondition (and (current_day day4) (at berlin) (direct_flight berlin warsaw) (next_day day4 day5) (w_count_2))
    :effect (and
      (occupied day4 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_berlin_to_warsaw_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (direct_flight berlin warsaw) (next_day day5 day6) (w_count_0))
    :effect (and
      (occupied day5 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (direct_flight berlin warsaw) (next_day day5 day6) (w_count_1))
    :effect (and
      (occupied day5 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_berlin_to_warsaw_day5_from2
    :parameters ()
    :precondition (and (current_day day5) (at berlin) (direct_flight berlin warsaw) (next_day day5 day6) (w_count_2))
    :effect (and
      (occupied day5 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_berlin_to_warsaw_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (direct_flight berlin warsaw) (last_day day6) (w_count_0))
    :effect (and
      (occupied day6 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_berlin_to_warsaw_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (direct_flight berlin warsaw) (last_day day6) (w_count_1))
    :effect (and
      (occupied day6 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_berlin_to_warsaw_day6_from2
    :parameters ()
    :precondition (and (current_day day6) (at berlin) (direct_flight berlin warsaw) (last_day day6) (w_count_2))
    :effect (and
      (occupied day6 warsaw)
      (not (at berlin))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_warsaw_to_berlin_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at warsaw) (direct_flight warsaw berlin) (next_day day1 day2) (be_count_0))
    :effect (and
      (occupied day1 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day1))
      (current_day day2)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (direct_flight warsaw berlin) (next_day day2 day3) (be_count_0))
    :effect (and
      (occupied day2 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (direct_flight warsaw berlin) (next_day day2 day3) (be_count_1))
    :effect (and
      (occupied day2 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_1))
      (be_count_2))
  )

  (:action fly_warsaw_to_berlin_day2_from2
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (direct_flight warsaw berlin) (next_day day2 day3) (be_count_2))
    :effect (and
      (occupied day2 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day2))
      (current_day day3)
      (not (be_count_2))
      (be_count_3))
  )

  (:action fly_warsaw_to_berlin_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (direct_flight warsaw berlin) (next_day day3 day4) (be_count_0))
    :effect (and
      (occupied day3 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (direct_flight warsaw berlin) (next_day day3 day4) (be_count_1))
    :effect (and
      (occupied day3 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_1))
      (be_count_2))
  )

  (:action fly_warsaw_to_berlin_day3_from2
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (direct_flight warsaw berlin) (next_day day3 day4) (be_count_2))
    :effect (and
      (occupied day3 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day3))
      (current_day day4)
      (not (be_count_2))
      (be_count_3))
  )

  (:action fly_warsaw_to_berlin_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (direct_flight warsaw berlin) (next_day day4 day5) (be_count_0))
    :effect (and
      (occupied day4 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (direct_flight warsaw berlin) (next_day day4 day5) (be_count_1))
    :effect (and
      (occupied day4 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_1))
      (be_count_2))
  )

  (:action fly_warsaw_to_berlin_day4_from2
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (direct_flight warsaw berlin) (next_day day4 day5) (be_count_2))
    :effect (and
      (occupied day4 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day4))
      (current_day day5)
      (not (be_count_2))
      (be_count_3))
  )

  (:action fly_warsaw_to_berlin_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (direct_flight warsaw berlin) (next_day day5 day6) (be_count_0))
    :effect (and
      (occupied day5 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (direct_flight warsaw berlin) (next_day day5 day6) (be_count_1))
    :effect (and
      (occupied day5 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_1))
      (be_count_2))
  )

  (:action fly_warsaw_to_berlin_day5_from2
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (direct_flight warsaw berlin) (next_day day5 day6) (be_count_2))
    :effect (and
      (occupied day5 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day5))
      (current_day day6)
      (not (be_count_2))
      (be_count_3))
  )

  (:action fly_warsaw_to_berlin_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (direct_flight warsaw berlin) (last_day day6) (be_count_0))
    :effect (and
      (occupied day6 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_0))
      (be_count_1))
  )

  (:action fly_warsaw_to_berlin_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (direct_flight warsaw berlin) (last_day day6) (be_count_1))
    :effect (and
      (occupied day6 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_1))
      (be_count_2))
  )

  (:action fly_warsaw_to_berlin_day6_from2
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (direct_flight warsaw berlin) (last_day day6) (be_count_2))
    :effect (and
      (occupied day6 berlin)
      (not (at warsaw))
      (at berlin)
      (not (current_day day6))
      (finished)
      (not (be_count_2))
      (be_count_3))
  )

  (:action fly_warsaw_to_bucharest_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at warsaw) (direct_flight warsaw bucharest) (next_day day1 day2) (b_count_0))
    :effect (and
      (occupied day1 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day1))
      (current_day day2)
      (not (b_count_0))
      (b_count_1))
  )

  (:action fly_warsaw_to_bucharest_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (direct_flight warsaw bucharest) (next_day day2 day3) (b_count_0))
    :effect (and
      (occupied day2 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day2))
      (current_day day3)
      (not (b_count_0))
      (b_count_1))
  )

  (:action fly_warsaw_to_bucharest_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at warsaw) (direct_flight warsaw bucharest) (next_day day2 day3) (b_count_1))
    :effect (and
      (occupied day2 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day2))
      (current_day day3)
      (not (b_count_1))
      (b_count_2))
  )

  (:action fly_warsaw_to_bucharest_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (direct_flight warsaw bucharest) (next_day day3 day4) (b_count_0))
    :effect (and
      (occupied day3 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day3))
      (current_day day4)
      (not (b_count_0))
      (b_count_1))
  )

  (:action fly_warsaw_to_bucharest_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at warsaw) (direct_flight warsaw bucharest) (next_day day3 day4) (b_count_1))
    :effect (and
      (occupied day3 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day3))
      (current_day day4)
      (not (b_count_1))
      (b_count_2))
  )

  (:action fly_warsaw_to_bucharest_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (direct_flight warsaw bucharest) (next_day day4 day5) (b_count_0))
    :effect (and
      (occupied day4 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day4))
      (current_day day5)
      (not (b_count_0))
      (b_count_1))
  )

  (:action fly_warsaw_to_bucharest_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at warsaw) (direct_flight warsaw bucharest) (next_day day4 day5) (b_count_1))
    :effect (and
      (occupied day4 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day4))
      (current_day day5)
      (not (b_count_1))
      (b_count_2))
  )

  (:action fly_warsaw_to_bucharest_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (direct_flight warsaw bucharest) (next_day day5 day6) (b_count_0))
    :effect (and
      (occupied day5 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (b_count_0))
      (b_count_1)
      (met_friend))
  )

  (:action fly_warsaw_to_bucharest_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at warsaw) (direct_flight warsaw bucharest) (next_day day5 day6) (b_count_1))
    :effect (and
      (occupied day5 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day5))
      (current_day day6)
      (not (b_count_1))
      (b_count_2)
      (met_friend))
  )

  (:action fly_warsaw_to_bucharest_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (direct_flight warsaw bucharest) (last_day day6) (b_count_0))
    :effect (and
      (occupied day6 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day6))
      (finished)
      (not (b_count_0))
      (b_count_1)
      (met_friend))
  )

  (:action fly_warsaw_to_bucharest_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at warsaw) (direct_flight warsaw bucharest) (last_day day6) (b_count_1))
    :effect (and
      (occupied day6 bucharest)
      (not (at warsaw))
      (at bucharest)
      (not (current_day day6))
      (finished)
      (not (b_count_1))
      (b_count_2)
      (met_friend))
  )

  (:action fly_bucharest_to_warsaw_day1_from0
    :parameters ()
    :precondition (and (current_day day1) (at bucharest) (direct_flight bucharest warsaw) (next_day day1 day2) (w_count_0))
    :effect (and
      (occupied day1 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day1))
      (current_day day2)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day2_from0
    :parameters ()
    :precondition (and (current_day day2) (at bucharest) (direct_flight bucharest warsaw) (next_day day2 day3) (w_count_0))
    :effect (and
      (occupied day2 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day2_from1
    :parameters ()
    :precondition (and (current_day day2) (at bucharest) (direct_flight bucharest warsaw) (next_day day2 day3) (w_count_1))
    :effect (and
      (occupied day2 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_bucharest_to_warsaw_day2_from2
    :parameters ()
    :precondition (and (current_day day2) (at bucharest) (direct_flight bucharest warsaw) (next_day day2 day3) (w_count_2))
    :effect (and
      (occupied day2 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day2))
      (current_day day3)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_bucharest_to_warsaw_day3_from0
    :parameters ()
    :precondition (and (current_day day3) (at bucharest) (direct_flight bucharest warsaw) (next_day day3 day4) (w_count_0))
    :effect (and
      (occupied day3 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day3_from1
    :parameters ()
    :precondition (and (current_day day3) (at bucharest) (direct_flight bucharest warsaw) (next_day day3 day4) (w_count_1))
    :effect (and
      (occupied day3 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_bucharest_to_warsaw_day3_from2
    :parameters ()
    :precondition (and (current_day day3) (at bucharest) (direct_flight bucharest warsaw) (next_day day3 day4) (w_count_2))
    :effect (and
      (occupied day3 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day3))
      (current_day day4)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_bucharest_to_warsaw_day4_from0
    :parameters ()
    :precondition (and (current_day day4) (at bucharest) (direct_flight bucharest warsaw) (next_day day4 day5) (w_count_0))
    :effect (and
      (occupied day4 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day4_from1
    :parameters ()
    :precondition (and (current_day day4) (at bucharest) (direct_flight bucharest warsaw) (next_day day4 day5) (w_count_1))
    :effect (and
      (occupied day4 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_bucharest_to_warsaw_day4_from2
    :parameters ()
    :precondition (and (current_day day4) (at bucharest) (direct_flight bucharest warsaw) (next_day day4 day5) (w_count_2))
    :effect (and
      (occupied day4 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day4))
      (current_day day5)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_bucharest_to_warsaw_day5_from0
    :parameters ()
    :precondition (and (current_day day5) (at bucharest) (direct_flight bucharest warsaw) (next_day day5 day6) (w_count_0))
    :effect (and
      (occupied day5 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day5_from1
    :parameters ()
    :precondition (and (current_day day5) (at bucharest) (direct_flight bucharest warsaw) (next_day day5 day6) (w_count_1))
    :effect (and
      (occupied day5 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_bucharest_to_warsaw_day5_from2
    :parameters ()
    :precondition (and (current_day day5) (at bucharest) (direct_flight bucharest warsaw) (next_day day5 day6) (w_count_2))
    :effect (and
      (occupied day5 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day5))
      (current_day day6)
      (not (w_count_2))
      (w_count_3))
  )

  (:action fly_bucharest_to_warsaw_day6_from0
    :parameters ()
    :precondition (and (current_day day6) (at bucharest) (direct_flight bucharest warsaw) (last_day day6) (w_count_0))
    :effect (and
      (occupied day6 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_0))
      (w_count_1))
  )

  (:action fly_bucharest_to_warsaw_day6_from1
    :parameters ()
    :precondition (and (current_day day6) (at bucharest) (direct_flight bucharest warsaw) (last_day day6) (w_count_1))
    :effect (and
      (occupied day6 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_1))
      (w_count_2))
  )

  (:action fly_bucharest_to_warsaw_day6_from2
    :parameters ()
    :precondition (and (current_day day6) (at bucharest) (direct_flight bucharest warsaw) (last_day day6) (w_count_2))
    :effect (and
      (occupied day6 warsaw)
      (not (at bucharest))
      (at warsaw)
      (not (current_day day6))
      (finished)
      (not (w_count_2))
      (w_count_3))
  )
)