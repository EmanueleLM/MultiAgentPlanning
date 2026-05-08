(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (at ?c - city ?d - day)
    (day_unassigned ?d - day)
    (succ ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (token_available ?t - token)
    (token_city ?t - token ?c - city)
    (token_used ?t - token)
    (met_friend)
  )

  (:action assign_day1
    :parameters (?c - city ?t - token)
    :precondition (and
      (day_unassigned day1)
      (token_available ?t)
      (token_city ?t ?c)
    )
    :effect (and
      (at ?c day1)
      (token_used ?t)
      (not (day_unassigned day1))
      (not (token_available ?t))
    )
  )

  (:action stay_same_city_next_day
    :parameters (?c - city ?t - token ?dprev - day ?d - day)
    :precondition (and
      (at ?c ?dprev)
      (succ ?dprev ?d)
      (day_unassigned ?d)
      (token_available ?t)
      (token_city ?t ?c)
    )
    :effect (and
      (at ?c ?d)
      (token_used ?t)
      (not (day_unassigned ?d))
      (not (token_available ?t))
    )
  )

  (:action fly_to_city_next_day
    :parameters (?from - city ?to - city ?t - token ?dprev - day ?d - day)
    :precondition (and
      (at ?from ?dprev)
      (succ ?dprev ?d)
      (flight ?from ?to)
      (day_unassigned ?d)
      (token_available ?t)
      (token_city ?t ?to)
    )
    :effect (and
      (at ?to ?d)
      (token_used ?t)
      (not (day_unassigned ?d))
      (not (token_available ?t))
    )
  )

  (:action meet_on_day10
    :parameters ()
    :precondition (and (at krakow day10))
    :effect (and (met_friend))
  )

  (:action meet_on_day11
    :parameters ()
    :precondition (and (at krakow day11))
    :effect (and (met_friend))
  )

  (:action meet_on_day12
    :parameters ()
    :precondition (and (at krakow day12))
    :effect (and (met_friend))
  )

  (:action meet_on_day13
    :parameters ()
    :precondition (and (at krakow day13))
    :effect (and (met_friend))
  )
)