(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (visited_count ?c - city ?n - count)
    (visited_at_least ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; The stay action represents spending a day in the current city.
  ;; It increments the current day and the visit count for that city.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?count_curr ?count_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?c ?count_curr)
      (next_count ?count_curr ?count_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (visited_count ?c ?count_curr))
      (visited_count ?c ?count_next)
      (visited_at_least ?c ?count_next)
    )
  )

  ;; The fly action represents a day spent commuting between two cities.
  ;; To accommodate the 12-day total constraint and the sum of requirements (14 days),
  ;; a flight day is counted as a visit day for both the source and destination cities.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?c_from_curr ?c_from_next - count ?c_to_curr ?c_to_next - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?from ?c_from_curr)
      (next_count ?c_from_curr ?c_from_next)
      (visited_count ?to ?c_to_curr)
      (next_count ?c_to_curr ?c_to_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (visited_count ?from ?c_from_curr))
      (visited_count ?from ?c_from_next)
      (visited_at_least ?from ?c_from_next)
      (not (visited_count ?to ?c_to_curr))
      (visited_count ?to ?c_to_next)
      (visited_at_least ?to ?c_to_next)
    )
  )
)