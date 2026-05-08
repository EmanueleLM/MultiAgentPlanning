(define (domain european_trip_6_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (start_chosen)
    (spent_day_in ?d - day ?c - city)
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

  (:action choose_start_berlin
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (start_chosen)
      (at berlin)
    )
  )

  (:action choose_start_warsaw
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (start_chosen)
      (at warsaw)
    )
  )

  (:action choose_start_bucharest
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (start_chosen)
      (at bucharest)
    )
  )

  (:action stay_berlin_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d1_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d2_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d3_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d4_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d5_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_berlin_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_0)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_berlin_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_1)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_d6_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_2)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_warsaw_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d1_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d2_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d3_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d4_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d5_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_0)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_warsaw_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_1)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_d6_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_2)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_bucharest_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d1)
      (next_day d1 d2)
      (bucharest_count_0)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d1)
      (next_day d1 d2)
      (bucharest_count_1)
    )
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d2)
      (next_day d2 d3)
      (bucharest_count_0)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d2)
      (next_day d2 d3)
      (bucharest_count_1)
    )
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d3)
      (next_day d3 d4)
      (bucharest_count_0)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d3)
      (next_day d3 d4)
      (bucharest_count_1)
    )
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d4)
      (next_day d4 d5)
      (bucharest_count_0)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d4)
      (next_day d4 d5)
      (bucharest_count_1)
    )
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_meet_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (met_friend)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_meet_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (met_friend)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_no_meet_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_0)
      (met_friend)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_no_meet_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_1)
      (met_friend)
    )
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_meet_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (met_friend)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_meet_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (met_friend)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action stay_bucharest_no_meet_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_0)
      (met_friend)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_bucharest_no_meet_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_1)
      (met_friend)
    )
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d1_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d2_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d3_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d4_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d5_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_berlin_to_warsaw_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_0)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_1)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d6_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at berlin)
      (direct_flight berlin warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_2)
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d1_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d1)
      (next_day d1 d2)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d2_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d2)
      (next_day d2 d3)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d3_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d3)
      (next_day d3 d4)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d4_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d4)
      (next_day d4 d5)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d5_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d5)
      (next_day d5 d6)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d6_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw berlin)
      (current_day d6)
      (next_day d6 d7)
      (berlin_count_2)
    )
    :effect (and
      (not (at warsaw))
      (at berlin)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 berlin)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_bucharest_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d1)
      (next_day d1 d2)
      (bucharest_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d1)
      (next_day d1 d2)
      (bucharest_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d2)
      (next_day d2 d3)
      (bucharest_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d2)
      (next_day d2 d3)
      (bucharest_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d3)
      (next_day d3 d4)
      (bucharest_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d3)
      (next_day d3 d4)
      (bucharest_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d4)
      (next_day d4 d5)
      (bucharest_count_0)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d4)
      (next_day d4 d5)
      (bucharest_count_1)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_meet_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (met_friend)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_meet_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (met_friend)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_no_meet_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_0)
      (met_friend)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_no_meet_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d5)
      (next_day d5 d6)
      (bucharest_count_1)
      (met_friend)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_meet_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (met_friend)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_meet_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (met_friend)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_no_meet_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_0)
      (met_friend)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_no_meet_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at warsaw)
      (direct_flight warsaw bucharest)
      (current_day d6)
      (next_day d6 d7)
      (bucharest_count_1)
      (met_friend)
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d1_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d1)
      (next_day d1 d2)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d1))
      (current_day d2)
      (spent_day_in d1 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d2_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d2)
      (next_day d2 d3)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d2))
      (current_day d3)
      (spent_day_in d2 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d3_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d3)
      (next_day d3 d4)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d3))
      (current_day d4)
      (spent_day_in d3 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d4_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d4)
      (next_day d4 d5)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d4))
      (current_day d5)
      (spent_day_in d4 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d5_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d5)
      (next_day d5 d6)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d5))
      (current_day d6)
      (spent_day_in d5 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_bucharest_to_warsaw_d6_0_1
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_0)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d6_1_2
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_1)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d6_2_3
    :parameters ()
    :precondition (and
      (start_chosen)
      (at bucharest)
      (direct_flight bucharest warsaw)
      (current_day d6)
      (next_day d6 d7)
      (warsaw_count_2)
    )
    :effect (and
      (not (at bucharest))
      (at warsaw)
      (not (current_day d6))
      (current_day d7)
      (spent_day_in d6 warsaw)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )
)