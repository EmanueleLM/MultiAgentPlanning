(define (domain travel)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (current_city ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (visited_city ?c - city)
    (at_day ?d - day)
    (flight_available ?from - city ?to - city)
    (attended_wedding_in_zurich)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?from)
      (flight_available ?from ?to)
      (at_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (visited_city ?to)
      (at_day ?d2)
      (not (at_day ?d1))
    )
  )

  (:action stay_in_city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?c)
      (at_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (at_day ?d2)
      (not (at_day ?d1))
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (current_city zurich)
      (at_day ?d)
      (or (and (next_day day1 ?d)) (and (next_day day2 ?d))
          (and (next_day day3 ?d)) (and (next_day day4 ?d))
          (and (next_day day5 ?d)) (and (next_day day6 ?d))
          (and (next_day day7 ?d))
      ))
    :effect (attended_wedding_in_zurich)
  )
)