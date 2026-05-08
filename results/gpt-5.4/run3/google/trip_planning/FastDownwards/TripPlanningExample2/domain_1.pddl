(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (trip_started)
    (visited_reykjavik)
    (visited_vienna)
    (visited_venice)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (current_day day_1)
      (at ?c day_1)
      (visited_reykjavik)
      (visited_vienna)
      (visited_venice)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2))
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2))
  )
)