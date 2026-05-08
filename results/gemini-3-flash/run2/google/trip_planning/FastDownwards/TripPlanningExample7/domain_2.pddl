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

  ;; The 'stay' action represents spending one full day in the current city.
  ;; It advances the timeline by one day and increments the stay count for that city.
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

  ;; The 'fly' action represents a travel day between two cities.
  ;; This action consumes one day of the total timeline but credits one stay day
  ;; to both the origin and the destination cities, effectively modeling the
  ;; overlap inherent in travel days.
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