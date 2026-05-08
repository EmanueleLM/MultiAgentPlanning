(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at_city ?c - city)
    (at_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (visited ?c - city ?d - day)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Spend a day in the current city. 
  ;; This action increments the stay counter for the city and moves the timeline forward.
  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (at_day ?d)
      (next_day ?d ?dn)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (at_day ?d))
      (at_day ?dn)
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another. 
  ;; In this model, the travel day counts as a visit to both the origin and the destination city.
  ;; Consequently, the stay counters for both cities are incremented, and both are marked as visited for that day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day ?nf - count ?nnf - count ?nt - count ?nnt - count)
    :precondition (and
      (at_city ?from)
      (at_day ?d)
      (next_day ?d ?dn)
      (can_fly ?from ?to)
      (stay_count ?from ?nf)
      (next_count ?nf ?nnf)
      (stay_count ?to ?nt)
      (next_count ?nt ?nnt)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (at_day ?d))
      (at_day ?dn)
      (not (stay_count ?from ?nf))
      (stay_count ?from ?nnf)
      (not (stay_count ?to ?nt))
      (stay_count ?to ?nnt)
      (visited ?from ?d)
      (visited ?to ?d)
    )
  )
)