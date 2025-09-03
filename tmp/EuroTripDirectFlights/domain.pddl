(define (domain integrated_travel)
  (:requirements :strips :typing :action-costs)
  (:types city day)
  (:predicates
    (current-city ?c - city)
    (visited ?c - city)
    (at ?c - city)
    (day ?d - day)
    (next-day ?d1 ?d2 - day)
    (available-flight ?from ?to - city)
    (total-cost ?c - number)
  )

  (:action fly1
    :parameters (?from - city ?to - city ?current_day - day ?next_day - day)
    :precondition (and
      (current-city ?from)
      (available-flight ?from ?to)
      (day ?current_day)
      (next-day ?current_day ?next_day)
    )
    :effect (and
      (not (current-city ?from))
      (current-city ?to)
      (visited ?to)
      (not (day ?current_day))
      (day ?next_day)
    )
    :cost (increase (total-cost) 1)
  )

  (:action stay
    :parameters (?current_city - city ?current_day - day ?next_day - day)
    :precondition (and
      (current-city ?current_city)
      (day ?current_day)
      (next-day ?current_day ?next_day)
    )
    :effect (and
      (not (day ?current_day))
      (day ?next_day)
    )
    :cost (increase (total-cost) 0)
  )

  (:action fly2
    :parameters (?from - city ?to - city ?current_day - day ?next_day - day)
    :precondition (and
      (at ?from)
      (available-flight ?from ?to)
      (day ?current_day)
      (next-day ?current_day ?next_day)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (not (day ?current_day))
      (day ?next_day)
    )
    :cost (increase (total-cost) 1)
  )
)