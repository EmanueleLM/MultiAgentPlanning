(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?s - step)
    (next_day ?d1 ?d2 - day)
    (next_step ?s1 ?s2 - step)
    (connection ?c1 ?c2 - city)
    (ready_to_start)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (ready_to_start)
    :effect (and
      (not (ready_to_start))
      (at ?c day_1)
      (visited ?c day_1)
      (not (stay_count ?c step_0))
      (stay_count ?c step_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 ?d2 - day ?s1 ?s2 - step)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (stay_count ?c ?s1)
      (next_step ?s1 ?s2)
    )
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
      (visited ?c ?d2)
      (not (stay_count ?c ?s1))
      (stay_count ?c ?s2)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d1 ?d2 - day ?s1 ?s2 - step)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (connection ?from ?to)
      (stay_count ?to ?s1)
      (next_step ?s1 ?s2)
    )
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
      (visited ?to ?d2)
      (not (stay_count ?to ?s1))
      (stay_count ?to ?s2)
    )
  )
)