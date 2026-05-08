(define (domain trip_planning_example_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city ?d - day)
    (current_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
    (ready_to_start)
  )

  ;; The start action initializes the trip on day 1 at a chosen city.
  (:action start
    :parameters (?c - city)
    :precondition (ready_to_start)
    :effect (and 
      (not (ready_to_start))
      (at_city ?c d1)
      (current_count ?c c1)
      (not (current_count ?c c0))
    )
  )

  ;; Staying in the same city for another day.
  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?count_prev - count ?count_new - count)
    :precondition (and 
      (at_city ?c ?d_from)
      (next_day ?d_from ?d_to)
      (current_count ?c ?count_prev)
      (next_count ?count_prev ?count_new)
    )
    :effect (and 
      (not (at_city ?c ?d_from))
      (at_city ?c ?d_to)
      (not (current_count ?c ?count_prev))
      (current_count ?c ?count_new)
    )
  )

  ;; Flying to a different city, consuming a day in the destination city.
  (:action fly
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?count_to_prev - count ?count_to_new - count)
    :precondition (and 
      (at_city ?from ?d_from)
      (next_day ?d_from ?d_to)
      (can_fly ?from ?to)
      (current_count ?to ?count_to_prev)
      (next_count ?count_to_prev ?count_to_new)
    )
    :effect (and 
      (not (at_city ?from ?d_from))
      (at_city ?to ?d_to)
      (not (current_count ?to ?count_to_prev))
      (current_count ?to ?count_to_new)
    )
  )
)