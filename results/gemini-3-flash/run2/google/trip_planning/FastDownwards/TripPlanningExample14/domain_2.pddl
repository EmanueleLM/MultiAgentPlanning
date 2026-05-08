(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (day_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (ready_to_start)
    (is_day_1 ?d - day)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (ready_to_start) (is_day_1 ?d))
    :effect (and
      (not (ready_to_start))
      (at ?c ?d)
      (not (day_count ?c count_0))
      (day_count ?c count_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 ?d2 - day ?n1 ?n2 - count)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (day_count ?c ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
      (not (day_count ?c ?n1))
      (day_count ?c ?n2)
    )
  )

  (:action fly
    :parameters (?c1 ?c2 - city ?d1 ?d2 - day ?n1 ?n2 - count)
    :precondition (and
      (at ?c1 ?d1)
      (next_day ?d1 ?d2)
      (flight ?c1 ?c2)
      (day_count ?c2 ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at ?c1 ?d1))
      (at ?c2 ?d2)
      (not (day_count ?c2 ?n1))
      (day_count ?c2 ?n2)
    )
  )
)