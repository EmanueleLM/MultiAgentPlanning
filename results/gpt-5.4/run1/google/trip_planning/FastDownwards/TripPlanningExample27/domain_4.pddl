(define (domain trip_planning_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (spent ?d - day ?c - city)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at amsterdam))
      (not (at istanbul))
      (not (at santorini))
      (not (spent day_1 amsterdam))
      (not (spent day_1 istanbul))
      (not (spent day_1 santorini))
    )
    :effect (and
      (at ?c)
      (spent day_1 ?c)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (spent ?d1 ?c)
      (not (spent ?d2 amsterdam))
      (not (spent ?d2 istanbul))
      (not (spent ?d2 santorini))
    )
    :effect (and
      (spent ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (spent ?d1 ?from)
      (direct ?from ?to)
      (not (spent ?d2 amsterdam))
      (not (spent ?d2 istanbul))
      (not (spent ?d2 santorini))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)