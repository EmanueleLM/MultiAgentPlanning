(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (flight ?from ?to - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
  )

  ;; Spend one day in the current city to increase its stay duration.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?c ?n_curr))
      (stay_count ?c ?n_next)
    )
  )

  ;; Fly from one city to another. This action consumes one day and counts as 
  ;; the first day of stay in the destination city.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?n_zero ?n_one - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?to ?n_zero)
      (next_count ?n_zero ?n_one)
      ;; Ensuring it's the first time we stay in the destination city
      ;; (optional, but consistent with the problem style).
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?to ?n_zero))
      (stay_count ?to ?n_one)
    )
  )
)