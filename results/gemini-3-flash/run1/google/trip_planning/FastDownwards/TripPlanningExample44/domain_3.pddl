(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (current_city ?c - city)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; The 'stay' action advances the trip to the next day while remaining in the same city.
  ;; This increments both the current day and the total count of days visited for that city.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_city ?c)
      (current_day ?d1)
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

  ;; The 'fly' action moves the person to a new city on the same day.
  ;; This allows a single day to count toward the visit duration of both the departure and arrival cities.
  ;; We prevent redundant counting for the same city on the same day using the 'at' predicate.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_city ?from)
      (current_day ?d)
      (flight ?from ?to)
      (visited_count ?to ?n1)
      (next_count ?n1 ?n2)
      (not (at ?to ?d))
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (at ?to ?d)
      (not (visited_count ?to ?n1))
      (visited_count ?to ?n2)
    )
  )
)