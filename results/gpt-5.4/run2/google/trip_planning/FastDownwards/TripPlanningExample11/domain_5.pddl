(define (domain tripplanningexample11_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at vienna))
      (not (at vilnius))
      (not (at valencia))
      (not (visited_on vienna day_1))
      (not (visited_on vilnius day_1))
      (not (visited_on valencia day_1))
    )
    :effect (and
      (at ?c)
      (visited_on ?c day_1)
    )
  )

  (:action stay_for_next_day
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?c)
      (visited_on ?c ?d)
      (not (visited_on vienna ?nd))
      (not (visited_on vilnius ?nd))
      (not (visited_on valencia ?nd))
    )
    :effect (and
      (visited_on ?c ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly_for_next_day
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (visited_on ?from ?d)
      (direct ?from ?to)
      (not (visited_on vienna ?nd))
      (not (visited_on vilnius ?nd))
      (not (visited_on valencia ?nd))
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )
)