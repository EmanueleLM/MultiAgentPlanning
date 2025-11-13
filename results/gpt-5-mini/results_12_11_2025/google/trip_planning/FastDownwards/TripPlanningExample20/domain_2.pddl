(define (domain trip_planning_example20)
  :requirements :strips :typing :negative-preconditions
  :types city day
  :predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 ?d2 - day)
    (served ?c - city ?d - day)
    (allowed-fly ?from - city ?to - city ?d - day)
  )

  ;; Stay action: consumes the current day, marks that city served on that day,
  ;; and advances current to the successor day.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current ?d) (at ?c) (next ?d ?d2))
    :effect (and (not (current ?d)) (current ?d2) (served ?c ?d))
  )

  ;; Fly action: instantaneous move that does not advance the day.
  ;; Use allowed-fly facts in the problem to restrict when a specific directed flight may occur.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (current ?d) (at ?from) (allowed-fly ?from ?to ?d))
    :effect (and (not (at ?from)) (at ?to))
  )
)