(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Action to spend a full day in the current city.
  ;; This increments the stay count for the city and advances the current day.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?c_curr - count ?c_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?c_curr)
      (next_count ?c_curr ?c_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?c ?c_curr))
      (stay_count ?c ?c_next)
    )
  )

  ;; Action to fly from one city to another.
  ;; In this model, the day of travel counts as a stay day for both the origin and the destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day ?c_from_curr - count ?c_from_next - count ?c_to_curr - count ?c_to_next - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?from ?c_from_curr)
      (next_count ?c_from_curr ?c_from_next)
      (stay_count ?to ?c_to_curr)
      (next_count ?c_to_curr ?c_to_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?from ?c_from_curr))
      (stay_count ?from ?c_from_next)
      (not (stay_count ?to ?c_to_curr))
      (stay_count ?to ?c_to_next)
    )
  )
)