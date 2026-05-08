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

  ;; Assign day1 to a city by consuming a city-specific token.
  (:action start_day1
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

  ;; Stay in the same city for the next day: predecessor day must already be assigned.
  (:action stay_same_city
    :parameters (?c - city ?t - token ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (day_unassigned ?d2)
      (token_available ?t)
      (token_city ?t ?c)
    )
    :effect (and
      (at ?c ?d2)
      (token_used ?t)
      (not (day_unassigned ?d2))
      (not (token_available ?t))
    )
  )

  ;; Move to a different city for the next day, only allowed if a direct flight exists from current city to destination.
  (:action move_to_city
    :parameters (?c1 - city ?c2 - city ?t - token ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c1 ?d1)
      (succ ?d1 ?d2)
      (flight ?c1 ?c2)
      (day_unassigned ?d2)
      (token_available ?t)
      (token_city ?t ?c2)
    )
    :effect (and
      (at ?c2 ?d2)
      (token_used ?t)
      (not (day_unassigned ?d2))
      (not (token_available ?t))
    )
  )

  ;; Meeting actions: can be applied when the corresponding day is assigned to krakow.
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