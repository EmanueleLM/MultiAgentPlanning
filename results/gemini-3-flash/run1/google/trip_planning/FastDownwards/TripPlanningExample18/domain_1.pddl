(define (domain trip_planning_example_18)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    count
  )
  (:predicates
    (at_city ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at_city ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c ?d)
      (next_day ?d ?dn)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (at_city ?c ?d))
      (at_city ?c ?dn)
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
    )
  )

  (:action fly
    :parameters (?c1 - city ?c2 - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c1 ?d)
      (next_day ?d ?dn)
      (flight ?c1 ?c2)
      (stay_count ?c1 ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (at_city ?c1 ?d))
      (at_city ?c2 ?dn)
      (not (stay_count ?c1 ?n))
      (stay_count ?c1 ?nn)
    )
  )
)