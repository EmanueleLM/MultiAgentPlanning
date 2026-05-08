(define (domain trip_planning_example_40)
    (:requirements :strips :typing)
    (:types city day count)
    (:predicates
      (at ?c - city)
      (current_day ?d - day)
      (count ?c - city ?n - count)
      (next_day ?d1 ?d2 - day)
      (next_count ?n1 ?n2 - count)
      (can_fly ?c1 ?c2 - city)
      (visited ?c - city ?d - day)
    )

    ;; Stay in the same city for the duration of a day.
    ;; This action increments the visit count for the city on the current day.
    (:action stay
      :parameters (?c - city ?d - day ?next_d - day ?n_old - count ?n_new - count)
      :precondition (and
        (at ?c)
        (current_day ?d)
        (next_day ?d ?next_d)
        (count ?c ?n_old)
        (next_count ?n_old ?n_new)
      )
      :effect (and
        (not (current_day ?d))
        (current_day ?next_d)
        (not (count ?c ?n_old))
        (count ?c ?n_new)
        (visited ?c ?d)
      )
    )

    ;; Fly from one city to another during a day.
    ;; This action counts the day as a visit for both the origin and the destination cities.
    (:action fly
      :parameters (?from - city ?to - city ?d - day ?next_d - day ?nf_old - count ?nf_new - count ?nt_old - count ?nt_new - count)
      :precondition (and
        (at ?from)
        (current_day ?d)
        (can_fly ?from ?to)
        (next_day ?d ?next_d)
        (count ?from ?nf_old)
        (next_count ?nf_old ?nf_new)
        (count ?to ?nt_old)
        (next_count ?nt_old ?nt_new)
      )
      :effect (and
        (not (at ?from))
        (at ?to)
        (not (current_day ?d))
        (current_day ?next_d)
        (not (count ?from ?nf_old))
        (count ?from ?nf_new)
        (not (count ?to ?nt_old))
        (count ?to ?nt_new)
        (visited ?from ?d)
        (visited ?to ?d)
      )
    )
  )