(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (visited_count ?c ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
      (not (visited_count ?c ?n1))
      (visited_count ?c ?n2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (flight ?from ?to)
      (visited_count ?to ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (not (visited_count ?to ?n1))
      (visited_count ?to ?n2)
    )
  )
)