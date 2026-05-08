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

  ;; Stay in the current city for another day.
  ;; Increases the day and the visit count for the city.
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

  ;; Fly from one city to another.
  ;; Advances the day and increments the visit count for the destination city.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n_to1 - count ?n_to2 - count)
    :precondition (and
      (current_day ?d1)
      (at ?from ?d1)
      (flight ?from ?to)
      (next_day ?d1 ?d2)
      (visited_count ?to ?n_to1)
      (next_count ?n_to1 ?n_to2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (not (visited_count ?to ?n_to1))
      (visited_count ?to ?n_to2)
    )
  )
)