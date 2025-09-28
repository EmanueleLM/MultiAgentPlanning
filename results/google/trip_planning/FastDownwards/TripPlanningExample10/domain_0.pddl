(define (domain trip)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; at CITY on DAY (presence at the start of that day)
    (next ?d1 - day ?d2 - day)       ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)   ; direct flight exists between two cities
  )

  ;; Stay in the same city from one day to the next.
  ;; Note: we purposely do not delete (at ?c ?d1) so presence facts accumulate for each visited day.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ;; Fly from one city to another in one day, but only if there is a direct connection.
  ;; This enforces the "only direct flights" hard constraint.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?to ?d2))
  )
)