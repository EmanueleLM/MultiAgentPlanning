tags as requested.

<domain>
(define (domain trip-planning)
  (:requirements :strips :typing :fluents :negative-preconditions :equality :adl)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)          ; at city at the start of day ?d
    (current ?d - day)              ; the current day pointer
    (next ?d - day ?d2 - day)       ; day successor relation
    (flight ?c1 - city ?c2 - city)  ; direct flight available from c1 to c2
  )

  (:functions
    (days-in ?c - city)   ; numeric count of days spent in each city
    (flight-count)        ; total number of flight legs taken
  )

  ;; Stay in the same city for the next day (consumes a day)
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (current ?d) (next ?d ?d2))
    :effect (and
             (not (at ?c ?d))
             (at ?c ?d2)
             (not (current ?d))
             (current ?d2)
             (increase (days-in ?c) 1)
            )
  )

  ;; Fly from one city to another (only allowed when a direct flight exists).
  ;; Flight consumes the current day and results in being at the destination on the next day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (current ?d) (next ?d ?d2) (flight ?from ?to))
    :effect (and
             (not (at ?from ?d))
             (at ?to ?d2)
             (not (current ?d))
             (current ?d2)
             (increase (days-in ?to) 1)
             (increase (flight-count) 1)
            )
  )
)