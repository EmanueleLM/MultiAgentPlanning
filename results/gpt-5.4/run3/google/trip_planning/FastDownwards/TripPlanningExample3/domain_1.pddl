(define (domain european_trip_6_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (assigned ?d - day)
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

  (:action start_in_berlin
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (berlin_count_0)
    )
    :effect (and
      (at berlin d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action start_in_warsaw
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (warsaw_count_0)
    )
    :effect (and
      (at warsaw d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action start_in_bucharest
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (assigned d1))
      (bucharest_count_0)
    )
    :effect (and
      (at bucharest d1)
      (assigned d1)
      (not (current_day d1))
      (current_day d2)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action stay_berlin_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (at berlin d1)
      (berlin_count_1)
      (not (assigned d2))
    )
    :effect (and
      (at berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_berlin_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (at berlin d2)
      (berlin_count_2)
      (not (assigned d3))
    )
    :effect (and
      (at berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_warsaw_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (at warsaw d1)
      (warsaw_count_1)
      (not (assigned d2))
    )
    :effect (and
      (at warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (at warsaw d2)
      (warsaw_count_2)
      (not (assigned d3))
    )
    :effect (and
      (at warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_bucharest_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (at bucharest d1)
      (bucharest_count_1)
      (not (assigned d2))
    )
    :effect (and
      (at bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_d2
    :parameters ()
    :precondition (and
      (current_day d2)
      (at berlin d1)
      (connected berlin warsaw)
      (warsaw_count_0)
      (not (assigned d2))
    )
    :effect (and
      (at warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_warsaw_to_berlin_d2
    :parameters ()
    :precondition (and
      (current_day d2)
      (at warsaw d1)
      (connected warsaw berlin)
      (berlin_count_0)
      (not (assigned d2))
    )
    :effect (and
      (at berlin d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_warsaw_to_bucharest_d2
    :parameters ()
    :precondition (and
      (current_day d2)
      (at warsaw d1)
      (connected warsaw bucharest)
      (bucharest_count_0)
      (not (assigned d2))
    )
    :effect (and
      (at bucharest d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d2
    :parameters ()
    :precondition (and
      (current_day d2)
      (at bucharest d1)
      (connected bucharest warsaw)
      (warsaw_count_0)
      (not (assigned d2))
    )
    :effect (and
      (at warsaw d2)
      (assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action fly_berlin_to_warsaw_d3
    :parameters ()
    :precondition (and
      (current_day d3)
      (at berlin d2)
      (connected berlin warsaw)
      (warsaw_count_1)
      (not (assigned d3))
    )
    :effect (and
      (at warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_warsaw_to_berlin_d3
    :parameters ()
    :precondition (and
      (current_day d3)
      (at warsaw d2)
      (connected warsaw berlin)
      (berlin_count_1)
      (not (assigned d3))
    )
    :effect (and
      (at berlin d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_d3
    :parameters ()
    :precondition (and
      (current_day d3)
      (at warsaw d2)
      (connected warsaw bucharest)
      (bucharest_count_1)
      (not (assigned d3))
    )
    :effect (and
      (at bucharest d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_d3
    :parameters ()
    :precondition (and
      (current_day d3)
      (at bucharest d2)
      (connected bucharest warsaw)
      (warsaw_count_1)
      (not (assigned d3))
    )
    :effect (and
      (at warsaw d3)
      (assigned d3)
      (not (current_day d3))
      (current_day d4)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_berlin_d4
    :parameters ()
    :precondition (and
      (current_day d4)
      (at berlin d3)
      (berlin_count_2)
      (not (assigned d4))
    )
    :effect (and
      (at berlin d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_warsaw_d4
    :parameters ()
    :precondition (and
      (current_day d4)
      (at warsaw d3)
      (warsaw_count_2)
      (not (assigned d4))
    )
    :effect (and
      (at warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_warsaw_to_bucharest_d4
    :parameters ()
    :precondition (and
      (current_day d4)
      (at warsaw d3)
      (connected warsaw bucharest)
      (bucharest_count_0)
      (not (assigned d4))
    )
    :effect (and
      (at bucharest d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action fly_bucharest_to_warsaw_d4
    :parameters ()
    :precondition (and
      (current_day d4)
      (at bucharest d3)
      (connected bucharest warsaw)
      (warsaw_count_2)
      (not (assigned d4))
    )
    :effect (and
      (at warsaw d4)
      (assigned d4)
      (not (current_day d4))
      (current_day d5)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_bucharest_meet_d5
    :parameters ()
    :precondition (and
      (current_day d5)
      (at bucharest d4)
      (bucharest_count_1)
      (not (assigned d5))
    )
    :effect (and
      (at bucharest d5)
      (assigned d5)
      (met_friend)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_warsaw_to_bucharest_meet_d5
    :parameters ()
    :precondition (and
      (current_day d5)
      (at warsaw d4)
      (connected warsaw bucharest)
      (bucharest_count_1)
      (not (assigned d5))
    )
    :effect (and
      (at bucharest d5)
      (assigned d5)
      (met_friend)
      (not (current_day d5))
      (current_day d6)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action meet_friend_d6
    :parameters ()
    :precondition (and
      (current_day d6)
      (at bucharest d5)
      (not (met_friend))
    )
    :effect (and
      (met_friend))
  )

  (:action finish_in_berlin
    :parameters ()
    :precondition (and
      (current_day d6)
      (at berlin d5)
      (berlin_count_2)
      (not (assigned d6))
    )
    :effect (and
      (at berlin d6)
      (assigned d6)
      (not (current_day d6))
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action finish_in_warsaw
    :parameters ()
    :precondition (and
      (current_day d6)
      (at warsaw d5)
      (warsaw_count_2)
      (not (assigned d6))
    )
    :effect (and
      (at warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action finish_in_bucharest
    :parameters ()
    :precondition (and
      (current_day d6)
      (at bucharest d5)
      (bucharest_count_1)
      (not (assigned d6))
    )
    :effect (and
      (at bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_berlin_to_warsaw_finish
    :parameters ()
    :precondition (and
      (current_day d6)
      (at berlin d5)
      (connected berlin warsaw)
      (warsaw_count_2)
      (not (assigned d6))
    )
    :effect (and
      (at warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_warsaw_to_berlin_finish
    :parameters ()
    :precondition (and
      (current_day d6)
      (at warsaw d5)
      (connected warsaw berlin)
      (berlin_count_2)
      (not (assigned d6))
    )
    :effect (and
      (at berlin d6)
      (assigned d6)
      (not (current_day d6))
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_warsaw_to_bucharest_finish
    :parameters ()
    :precondition (and
      (current_day d6)
      (at warsaw d5)
      (connected warsaw bucharest)
      (bucharest_count_1)
      (not (assigned d6))
    )
    :effect (and
      (at bucharest d6)
      (assigned d6)
      (not (current_day d6))
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action fly_bucharest_to_warsaw_finish
    :parameters ()
    :precondition (and
      (current_day d6)
      (at bucharest d5)
      (connected bucharest warsaw)
      (warsaw_count_2)
      (not (assigned d6))
    )
    :effect (and
      (at warsaw d6)
      (assigned d6)
      (not (current_day d6))
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )
)