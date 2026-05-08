(define (domain european_trip_6_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at_day ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
    (trip_complete)
    (met_friend)

    (berlin_count_0)
    (berlin_count_1)
    (berlin_count_2)
    (berlin_count_3)

    (warsaw_count_0)
    (warsaw_count_1)
    (warsaw_count_2)
    (warsaw_count_3)

    (bucharest_count_0)
    (bucharest_count_1)
    (bucharest_count_2)
  )

  (:action assign_first_day_berlin_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action assign_first_day_berlin_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action assign_first_day_berlin_from_2
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action assign_first_day_warsaw_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action assign_first_day_warsaw_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action assign_first_day_warsaw_from_2
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action assign_first_day_bucharest_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action assign_first_day_bucharest_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_berlin_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (not (assigned d2))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (not (assigned d2))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d1_d2_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (not (assigned d2))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (not (assigned d3))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (not (assigned d3))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d2_d3_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (not (assigned d3))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (not (assigned d4))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (not (assigned d4))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d3_d4_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (not (assigned d4))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d4_d5_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (not (assigned d5))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d4_d5_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (not (assigned d5))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d4_d5_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (not (assigned d5))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d5_d6_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (not (assigned d6))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d5_d6_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (not (assigned d6))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d5_d6_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (not (assigned d6))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_warsaw_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (not (assigned d2))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (not (assigned d2))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d1_d2_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (not (assigned d2))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (not (assigned d3))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (not (assigned d3))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d2_d3_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (not (assigned d3))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (not (assigned d4))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (not (assigned d4))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d3_d4_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (not (assigned d4))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d4_d5_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (not (assigned d5))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d4_d5_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (not (assigned d5))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d4_d5_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (not (assigned d5))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d5_d6_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (not (assigned d6))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d5_d6_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (not (assigned d6))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d5_d6_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (not (assigned d6))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_bucharest_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day bucharest d1)
      (not (assigned d2))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day bucharest d1)
      (not (assigned d2))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day bucharest d2)
      (not (assigned d3))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day bucharest d2)
      (not (assigned d3))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day bucharest d3)
      (not (assigned d4))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day bucharest d3)
      (not (assigned d4))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d4_d5_from_0_meet
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day bucharest d4)
      (not (assigned d5))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_0))
      (bucharest_count_1)
      (met_friend)
    )
  )

  (:action stay_bucharest_d4_d5_from_1_meet
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day bucharest d4)
      (not (assigned d5))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (met_friend)
    )
  )

  (:action stay_bucharest_d5_d6_from_0_meet
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day bucharest d5)
      (not (assigned d6))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (bucharest_count_0))
      (bucharest_count_1)
      (met_friend)
    )
  )

  (:action stay_bucharest_d5_d6_from_1_meet
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day bucharest d5)
      (not (assigned d6))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (met_friend)
    )
  )

  (:action fly_berlin_to_warsaw_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (connected berlin warsaw)
      (not (assigned d2))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (connected berlin warsaw)
      (not (assigned d2))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d1_d2_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day berlin d1)
      (connected berlin warsaw)
      (not (assigned d2))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (connected berlin warsaw)
      (not (assigned d3))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (connected berlin warsaw)
      (not (assigned d3))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d2_d3_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day berlin d2)
      (connected berlin warsaw)
      (not (assigned d3))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (connected berlin warsaw)
      (not (assigned d4))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (connected berlin warsaw)
      (not (assigned d4))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d3_d4_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day berlin d3)
      (connected berlin warsaw)
      (not (assigned d4))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d4_d5_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (connected berlin warsaw)
      (not (assigned d5))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d4_d5_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (connected berlin warsaw)
      (not (assigned d5))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d4_d5_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day berlin d4)
      (connected berlin warsaw)
      (not (assigned d5))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d5_d6_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (connected berlin warsaw)
      (not (assigned d6))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d5_d6_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (connected berlin warsaw)
      (not (assigned d6))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d5_d6_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day berlin d5)
      (connected berlin warsaw)
      (not (assigned d6))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (connected warsaw berlin)
      (not (assigned d2))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (connected warsaw berlin)
      (not (assigned d2))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d1_d2_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (connected warsaw berlin)
      (not (assigned d2))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (connected warsaw berlin)
      (not (assigned d3))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (connected warsaw berlin)
      (not (assigned d3))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d2_d3_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (connected warsaw berlin)
      (not (assigned d3))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (connected warsaw berlin)
      (not (assigned d4))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (connected warsaw berlin)
      (not (assigned d4))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d3_d4_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (connected warsaw berlin)
      (not (assigned d4))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d4_d5_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (connected warsaw berlin)
      (not (assigned d5))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d4_d5_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (connected warsaw berlin)
      (not (assigned d5))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d4_d5_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (connected warsaw berlin)
      (not (assigned d5))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d5_d6_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (connected warsaw berlin)
      (not (assigned d6))
      (berlin_count_0)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d5_d6_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (connected warsaw berlin)
      (not (assigned d6))
      (berlin_count_1)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d5_d6_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (connected warsaw berlin)
      (not (assigned d6))
      (berlin_count_2)
    )
    :effect (and
      (at_day berlin d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_bucharest_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (connected warsaw bucharest)
      (not (assigned d2))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day warsaw d1)
      (connected warsaw bucharest)
      (not (assigned d2))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (connected warsaw bucharest)
      (not (assigned d3))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day warsaw d2)
      (connected warsaw bucharest)
      (not (assigned d3))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (connected warsaw bucharest)
      (not (assigned d4))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day warsaw d3)
      (connected warsaw bucharest)
      (not (assigned d4))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d4_d5_from_0_meet
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (connected warsaw bucharest)
      (not (assigned d5))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_0))
      (bucharest_count_1)
      (met_friend)
    )
  )

  (:action fly_warsaw_to_bucharest_d4_d5_from_1_meet
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day warsaw d4)
      (connected warsaw bucharest)
      (not (assigned d5))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (met_friend)
    )
  )

  (:action fly_warsaw_to_bucharest_d5_d6_from_0_meet
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (connected warsaw bucharest)
      (not (assigned d6))
      (bucharest_count_0)
    )
    :effect (and
      (at_day bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (bucharest_count_0))
      (bucharest_count_1)
      (met_friend)
    )
  )

  (:action fly_warsaw_to_bucharest_d5_d6_from_1_meet
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day warsaw d5)
      (connected warsaw bucharest)
      (not (assigned d6))
      (bucharest_count_1)
    )
    :effect (and
      (at_day bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (met_friend)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_d2_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day bucharest d1)
      (connected bucharest warsaw)
      (not (assigned d2))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_d2_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day bucharest d1)
      (connected bucharest warsaw)
      (not (assigned d2))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_d2_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d1 d2)
      (at_day bucharest d1)
      (connected bucharest warsaw)
      (not (assigned d2))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_d3_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day bucharest d2)
      (connected bucharest warsaw)
      (not (assigned d3))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_d3_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day bucharest d2)
      (connected bucharest warsaw)
      (not (assigned d3))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_d3_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d2 d3)
      (at_day bucharest d2)
      (connected bucharest warsaw)
      (not (assigned d3))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_d4_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day bucharest d3)
      (connected bucharest warsaw)
      (not (assigned d4))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_d4_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day bucharest d3)
      (connected bucharest warsaw)
      (not (assigned d4))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_d4_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d3 d4)
      (at_day bucharest d3)
      (connected bucharest warsaw)
      (not (assigned d4))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_d5_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day bucharest d4)
      (connected bucharest warsaw)
      (not (assigned d5))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_d5_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day bucharest d4)
      (connected bucharest warsaw)
      (not (assigned d5))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_d5_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d4 d5)
      (at_day bucharest d4)
      (connected bucharest warsaw)
      (not (assigned d5))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d5)
      (assigned d5)
      (not (current_day d5))
      (current_day d6)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_d6_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day bucharest d5)
      (connected bucharest warsaw)
      (not (assigned d6))
      (warsaw_count_0)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_d6_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day bucharest d5)
      (connected bucharest warsaw)
      (not (assigned d6))
      (warsaw_count_1)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_d6_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d5 d6)
      (at_day bucharest d5)
      (connected bucharest warsaw)
      (not (assigned d6))
      (warsaw_count_2)
    )
    :effect (and
      (at_day warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (trip_complete)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )
)