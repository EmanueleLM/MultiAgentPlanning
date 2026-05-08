(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct_flight ?c1 - city ?c2 - city)
    (has_token ?t - token)
    (token_for ?t - token ?c - city)
  )

  ;; assign city for day1, consuming a city-specific token
  (:action assign_day1
    :parameters (?c - city ?t - token)
    :precondition (and
      (not (assigned day1))
      (has_token ?t)
      (token_for ?t ?c)
    )
    :effect (and
      (at ?c day1)
      (assigned day1)
      (not (has_token ?t))
    )
  )

  ;; stay in same city from day ?d to successor ?dn, consuming a token for the city
  (:action stay_next_day
    :parameters (?c - city ?d - day ?dn - day ?t - token)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (not (assigned ?dn))
      (has_token ?t)
      (token_for ?t ?c)
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
      (not (has_token ?t))
    )
  )

  ;; fly from ?from to ?to between consecutive days, consuming a token for destination city
  (:action fly_next_day
    :parameters (?from - city ?to - city ?d - day ?dn - day ?t - token)
    :precondition (and
      (at ?from ?d)
      (direct_flight ?from ?to)
      (next ?d ?dn)
      (not (assigned ?dn))
      (has_token ?t)
      (token_for ?t ?to)
    )
    :effect (and
      (at ?to ?dn)
      (assigned ?dn)
      (not (has_token ?t))
    )
  )
)