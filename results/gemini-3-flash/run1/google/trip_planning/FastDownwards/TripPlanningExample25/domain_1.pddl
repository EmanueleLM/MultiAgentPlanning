(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (days_spent ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Stay in the current city for one full day, incrementing the count for that city
  ;; and advancing the calendar.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (days_spent ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_spent ?c ?n_curr))
      (days_spent ?c ?n_next)
      (visited ?c ?d_curr)
    )
  )

  ;; Fly from one city to another, taking one day. This transition day
  ;; counts as a day spent in both the departure and arrival cities.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?nf_curr ?nf_next ?nt_curr ?nt_next - count)
    :precondition (and
      (at ?from)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (flight ?from ?to)
      (days_spent ?from ?nf_curr)
      (next_count ?nf_curr ?nf_next)
      (days_spent ?to ?nt_curr)
      (next_count ?nt_curr ?nt_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_spent ?from ?nf_curr))
      (days_spent ?from ?nf_next)
      (not (days_spent ?to ?nt_curr))
      (days_spent ?to ?nt_next)
      (visited ?from ?d_curr)
      (visited ?to ?d_curr)
    )
  )
)