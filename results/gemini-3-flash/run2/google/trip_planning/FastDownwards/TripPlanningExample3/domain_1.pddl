(define (domain trip_planning)
  (:requirements :typing :negative-preconditions)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
  )

  ;; Stay in the current city for another day.
  ;; This action transitions from the current day to the next and increments the stay count for the city.
  (:action stay
    :parameters (?c - city ?d_now ?d_next - day ?c_now ?c_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (stay_count ?c ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (stay_count ?c ?c_now))
      (stay_count ?c ?c_next)
      (visited ?c ?d_next)
    )
  )

  ;; Fly from one city to another.
  ;; In this model, a travel day (d_next) counts as a day spent in BOTH the origin and the destination cities.
  (:action fly
    :parameters (?from ?to - city ?d_now ?d_next - day ?cf_now ?cf_next ?ct_now ?ct_next - count)
    :precondition (and
      (at ?from)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (connected ?from ?to)
      (stay_count ?from ?cf_now)
      (next_count ?cf_now ?cf_next)
      (stay_count ?to ?ct_now)
      (next_count ?ct_now ?ct_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (stay_count ?from ?cf_now))
      (stay_count ?from ?cf_next)
      (not (stay_count ?to ?ct_now))
      (stay_count ?to ?ct_next)
      (visited ?from ?d_next)
      (visited ?to ?d_next)
    )
  )
)