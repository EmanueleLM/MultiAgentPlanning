(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (at_day ?d - day)
    (stay_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (not_started)
  )

  ;; Initial step to place the traveler in their starting city.
  (:action start
    :parameters (?c - city)
    :precondition (and (at_day d1) (not_started))
    :effect (and (at_city ?c) (not (not_started)))
  )

  ;; Spend a day in the current city.
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

  ;; Fly from one city to another. The day of travel counts as a visit to both cities.
  (:action fly
    :parameters (?cf - city ?ct - city ?d - day ?dn - day ?nf - count ?nfn - count ?nt - count ?ntn - count)
    :precondition (and
      (at_city ?cf)
      (at_day ?d)
      (next_day ?d ?dn)
      (can_fly ?cf ?ct)
      (stay_count ?cf ?nf)
      (next_count ?nf ?nfn)
      (stay_count ?ct ?nt)
      (next_count ?nt ?ntn)
    )
    :effect (and
      (not (at_city ?cf))
      (at_city ?ct)
      (not (at_day ?d))
      (at_day ?dn)
      (not (stay_count ?cf ?nf))
      (stay_count ?cf ?nfn)
      (not (stay_count ?ct ?nt))
      (stay_count ?ct ?ntn)
      (visited ?cf ?d)
      (visited ?ct ?d)
    )
  )
)