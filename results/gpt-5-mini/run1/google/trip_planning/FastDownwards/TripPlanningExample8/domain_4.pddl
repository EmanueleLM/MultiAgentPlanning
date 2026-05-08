(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)
    (unassigned ?d - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (flight_taken ?from - city ?to - city ?d - day)
    (total_days_16)
  )

  (:action start-day1
    :parameters (?c - city)
    :precondition (unassigned day1)
    :effect (and (not (unassigned day1)) (at ?c day1))
  )

  (:action stay-next-day
    :parameters (?c - city ?dprev - day ?d - day)
    :precondition (and (at ?c ?dprev) (succ ?dprev ?d) (unassigned ?d))
    :effect (and (not (unassigned ?d)) (at ?c ?d))
  )

  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?d - day)
    :precondition (and (at ?from ?dprev) (succ ?dprev ?d) (unassigned ?d) (direct_flight ?from ?to))
    :effect (and (not (unassigned ?d)) (at ?to ?d) (flight_taken ?from ?to ?d))
  )
)