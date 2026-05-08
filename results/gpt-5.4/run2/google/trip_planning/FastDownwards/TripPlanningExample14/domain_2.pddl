(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited_frankfurt)
    (visited_krakow)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at lyon day_1))
      (not (at frankfurt day_1))
      (not (at krakow day_1))
    )
    :effect (at ?c day_1)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at lyon ?d2))
      (not (at frankfurt ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at lyon ?d2))
      (not (at frankfurt ?d2))
      (not (at krakow ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action mark_frankfurt_visit
    :parameters (?d - day)
    :precondition (and
      (at frankfurt ?d)
      (not (visited_frankfurt))
    )
    :effect (visited_frankfurt)
  )

  (:action mark_krakow_visit
    :parameters (?d - day)
    :precondition (and
      (at krakow ?d)
      (not (visited_krakow))
    )
    :effect (visited_krakow)
  )
)