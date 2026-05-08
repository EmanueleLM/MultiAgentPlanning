(define (domain trip_planning_example_16)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)
    (city_visited_day ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Action to advance the calendar day while staying in the same city.
  ;; This increments the city's visit count for the new day.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (city_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (not (at ?c ?d_curr))
      (at ?c ?d_next)
      (city_visited_day ?c ?d_next)
      (not (city_count ?c ?n_curr))
      (city_count ?c ?n_next)
    )
  )

  ;; Action to fly to a new city on the same day for the first time.
  ;; This increments the destination city's visit count for that day.
  (:action fly_first_time_today
    :parameters (?from - city ?to - city ?d - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (not (city_visited_day ?to ?d))
      (city_count ?to ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d)
      (city_visited_day ?to ?d)
      (not (city_count ?to ?n_curr))
      (city_count ?to ?n_next)
    )
  )

  ;; Action to fly to a city on the same day that has already been visited today.
  ;; This changes the current location without incrementing any visit counts.
  (:action fly_repeat_today
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (city_visited_day ?to ?d)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d)
    )
  )
)