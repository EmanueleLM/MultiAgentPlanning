(define (domain trip_planning_example17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
    (count_value ?n - count)
    (count_next ?n1 - count ?n2 - count)
  )

  (:action start_day_1
    :parameters (?c - city ?n1 - count ?n2 - count ?d - day)
    :precondition (and
      (not (at ?c))
      (count_value ?n1)
      (count_next ?n1 ?n2)
      (occupied ?d ?c)
    )
    :effect (and
      (at ?c)
      (current_day ?d)
      (not (count_value ?n1))
      (count_value ?n2)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 ?c)
      (count_value ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_value ?n1))
      (count_value ?n2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
      (count_value ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (occupied ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_value ?n1))
      (count_value ?n2)
    )
  )
)