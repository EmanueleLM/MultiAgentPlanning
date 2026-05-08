(define (domain trip_planning_example3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current ?d - day)
    (occupied ?d - day ?c - city)

    (friend_window ?d - day)
    (met_friend)

    (need_berlin_start)
    (need_warsaw_start)
    (need_bucharest_start)

    (berlin_started)
    (warsaw_started)
    (bucharest_started)

    (berlin_done)
    (warsaw_done)
    (bucharest_done)
  )

  (:action occupy_berlin_day1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at berlin)
      (need_berlin_start)
      (not (berlin_started))
      (not (warsaw_started))
      (not (bucharest_started))
      (not (occupied ?d1 berlin))
    )
    :effect (and
      (occupied ?d1 berlin)
      (not (current ?d1))
      (current ?d2)
      (not (need_berlin_start))
      (berlin_started)
    )
  )

  (:action occupy_berlin_day2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at berlin)
      (berlin_started)
      (not (berlin_done))
      (not (warsaw_started))
      (not (bucharest_started))
      (occupied day1 berlin)
      (not (occupied ?d1 berlin))
    )
    :effect (and
      (occupied ?d1 berlin)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action occupy_berlin_day3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at berlin)
      (berlin_started)
      (not (berlin_done))
      (not (warsaw_started))
      (not (bucharest_started))
      (occupied day1 berlin)
      (occupied day2 berlin)
      (not (occupied ?d1 berlin))
    )
    :effect (and
      (occupied ?d1 berlin)
      (not (current ?d1))
      (current ?d2)
      (berlin_done)
    )
  )

  (:action fly_berlin_to_warsaw
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (at berlin)
      (direct berlin warsaw)
      (berlin_done)
      (not (warsaw_started))
      (not (bucharest_started))
    )
    :effect (and
      (not (at berlin))
      (at warsaw)
    )
  )

  (:action occupy_warsaw_day4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at warsaw)
      (need_warsaw_start)
      (berlin_done)
      (not (warsaw_started))
      (not (bucharest_started))
      (not (occupied ?d1 warsaw))
    )
    :effect (and
      (occupied ?d1 warsaw)
      (not (current ?d1))
      (current ?d2)
      (not (need_warsaw_start))
      (warsaw_started)
    )
  )

  (:action occupy_warsaw_day5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at warsaw)
      (warsaw_started)
      (not (warsaw_done))
      (not (bucharest_started))
      (occupied day4 warsaw)
      (not (occupied ?d1 warsaw))
    )
    :effect (and
      (occupied ?d1 warsaw)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action occupy_warsaw_day6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at warsaw)
      (warsaw_started)
      (not (warsaw_done))
      (not (bucharest_started))
      (occupied day4 warsaw)
      (occupied day5 warsaw)
      (not (occupied ?d1 warsaw))
    )
    :effect (and
      (occupied ?d1 warsaw)
      (not (current ?d1))
      (current ?d2)
      (warsaw_done)
    )
  )

  (:action fly_warsaw_to_bucharest
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (at warsaw)
      (direct warsaw bucharest)
      (warsaw_done)
      (not (bucharest_started))
    )
    :effect (and
      (not (at warsaw))
      (at bucharest)
    )
  )

  (:action meet_friend_day5
    :parameters ()
    :precondition (and
      (at bucharest)
      (friend_window day5)
      (occupied day5 bucharest)
      (not (met_friend))
    )
    :effect (and
      (met_friend))
  )

  (:action meet_friend_day6
    :parameters ()
    :precondition (and
      (at bucharest)
      (friend_window day6)
      (occupied day6 bucharest)
      (not (met_friend))
    )
    :effect (and
      (met_friend))
  )

  (:action occupy_bucharest_day5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at bucharest)
      (need_bucharest_start)
      (warsaw_done)
      (not (bucharest_started))
      (not (occupied ?d1 bucharest))
    )
    :effect (and
      (occupied ?d1 bucharest)
      (not (current ?d1))
      (current ?d2)
      (not (need_bucharest_start))
      (bucharest_started)
    )
  )

  (:action occupy_bucharest_day6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at bucharest)
      (bucharest_started)
      (not (bucharest_done))
      (occupied day5 bucharest)
      (not (occupied ?d1 bucharest))
    )
    :effect (and
      (occupied ?d1 bucharest)
      (not (current ?d1))
      (current ?d2)
      (bucharest_done)
    )
  )
)