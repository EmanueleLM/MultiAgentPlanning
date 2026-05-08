(define (domain trip_planning_example_28)
  (:requirements :strips :typing)
  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?c1 - count ?c2 - count)
    (visited_count ?city - city ?count - count)
  )

  ;; Stay in the current city for one day.
  ;; This action increments the visit count for the city and advances the day.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?c_old - count ?c_new - count)
    :precondition (and
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?c ?c_old)
      (next_count ?c_old ?c_new)
    )
    :effect (and
      (not (at ?c ?d_curr))
      (at ?c ?d_next)
      (not (visited_count ?c ?c_old))
      (visited_count ?c ?c_new)
    )
  )

  ;; Fly from one city to another.
  ;; This action counts the travel day as a visit to BOTH the origin and destination cities.
  ;; This is the interpretation that allows 14 man-days of visitation to fit into a 12-day timeline.
  (:action fly
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day ?c_from_old - count ?c_from_new - count ?c_to_old - count ?c_to_new - count)
    :precondition (and
      (at ?from ?d_curr)
      (flight ?from ?to)
      (next_day ?d_curr ?d_next)
      (visited_count ?from ?c_from_old)
      (next_count ?c_from_old ?c_from_new)
      (visited_count ?to ?c_to_old)
      (next_count ?c_to_old ?c_to_new)
    )
    :effect (and
      (not (at ?from ?d_curr))
      (at ?to ?d_next)
      (not (visited_count ?from ?c_from_old))
      (visited_count ?from ?c_from_new)
      (not (visited_count ?to ?c_to_old))
      (visited_count ?to ?c_to_new)
    )
  )
)