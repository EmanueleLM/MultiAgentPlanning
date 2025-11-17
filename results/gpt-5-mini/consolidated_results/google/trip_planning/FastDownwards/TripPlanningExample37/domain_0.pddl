(define (domain travel-scheduling)
  (:requirements :typing :strips)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)        ; agent is at city on a specific day
    (next ?d1 - day ?d2 - day)               ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)           ; there is a direct flight between two cities
    (visited ?c - city)                      ; city has been visited at least once
  )

  ;; Stay action: remain in the same city from day D to its successor day D2
  (:action stay
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?c ?d) (next ?d ?d2))
    :effect (and (at ?a ?c ?d2) (visited ?c))
  )

  ;; Travel by a direct flight from city FROM to city TO, arriving on the next day
  (:action travel-direct
    :parameters (?a - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?from ?d) (direct ?from ?to) (next ?d ?d2))
    :effect (and (at ?a ?to ?d2) (visited ?to))
  )
)