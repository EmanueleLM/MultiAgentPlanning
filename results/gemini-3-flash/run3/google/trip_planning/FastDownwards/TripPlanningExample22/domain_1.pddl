(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
    (counted ?d - day)
    (visit_count ?c - city ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (current_day ?d - day)
  )

  (:action travel
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (current_day ?d1) (at ?from ?d1) (next_day ?d1 ?d2) (connected ?from ?to))
    :effect (and (at ?to ?d2) (current_day ?d2) (not (current_day ?d1)))
  )

  (:action dwell
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (current_day ?d1) (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (at ?c ?d2) (current_day ?d2) (not (current_day ?d1)))
  )

  (:action record_visit
    :parameters (?c - city ?d - day ?s1 ?s2 - slot)
    :precondition (and (at ?c ?d) (not (counted ?d)) (visit_count ?c ?s1) (next_slot ?s1 ?s2))
    :effect (and (not (visit_count ?c ?s1)) (visit_count ?c ?s2) (counted ?d))
  )
)