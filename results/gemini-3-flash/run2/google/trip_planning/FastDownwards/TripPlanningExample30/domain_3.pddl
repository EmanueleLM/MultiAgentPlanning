(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (day_next ?d1 - day ?d2 - day)
    (visited_at ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (count_next ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?from)
      (current_day ?d)
      (can_fly ?from ?to)
      (city_count ?from ?n)
      (count_next ?n ?nn)
      (not (visited_at ?from ?d))
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (visited_at ?from ?d)
      (not (city_count ?from ?n))
      (city_count ?from ?nn)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (day_next ?d ?nd)
      (city_count ?c ?n)
      (count_next ?n ?nn)
      (not (visited_at ?c ?d))
    )
    :effect (and
      (visited_at ?c ?d)
      (not (city_count ?c ?n))
      (city_count ?c ?nn)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )
)