(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (flight ?from ?to - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
  )

  ;; Spend a day in the current city. This increments the stay count for that city and advances the day.
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

  ;; Fly from one city to another. 
  ;; The day of travel counts as a stay day for BOTH the origin city (the day you leave)
  ;; and the destination city (the day you arrive).
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?nf_curr ?nf_next - count ?nt_curr ?nt_next - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?from ?nf_curr)
      (next_count ?nf_curr ?nf_next)
      (stay_count ?to ?nt_curr)
      (next_count ?nt_curr ?nt_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?from ?nf_curr))
      (stay_count ?from ?nf_next)
      (not (stay_count ?to ?nt_curr))
      (stay_count ?to ?nt_next)
    )
  )
)