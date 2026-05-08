(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
    (not_started)
  )

  ;; Start the trip by placing the agent at an initial city.
  (:action start_at
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and (not (not_started)) (at ?c))
  )

  ;; Fly between cities. This does not consume a day, allowing for overlapping visits.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (can_fly ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Advance to the next day.
  (:action advance_day
    :parameters (?d_from - day ?d_to - day)
    :precondition (and (current_day ?d_from) (next_day ?d_from ?d_to))
    :effect (and (not (current_day ?d_from)) (current_day ?d_to))
  )

  ;; Mark the current city as visited on the current day and increment the stay count for that city.
  ;; Each city can only be counted once per calendar day.
  (:action visit
    :parameters (?c - city ?d - day ?cur - count ?nxt - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (city_count ?c ?cur)
      (next_count ?cur ?nxt)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d)
      (not (city_count ?c ?cur))
      (city_count ?c ?nxt)
    )
  )
)