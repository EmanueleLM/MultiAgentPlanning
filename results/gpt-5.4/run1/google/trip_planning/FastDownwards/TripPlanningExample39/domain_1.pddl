(define (domain european_trip_12day_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (today ?d - day)

    (in_city_on ?c - city ?d - day)

    (visited_relatives)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (in_city_on ?c ?d))
    )
    :effect (and
      (in_city_on ?c ?d)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_and_stay
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (in_city_on ?to ?d))
    )
    :effect (and
      (in_city_on ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action stay_in_porto_and_visit_relatives
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at porto)
      (not (in_city_on porto ?d))
      (not (visited_relatives))
    )
    :effect (and
      (in_city_on porto ?d)
      (visited_relatives)
      (not (today ?d))
      (today ?d2)
    )
  )
)