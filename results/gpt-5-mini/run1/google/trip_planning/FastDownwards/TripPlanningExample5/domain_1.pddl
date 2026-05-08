(define (domain travel_orchestration)
  (:requirements :strips :typing)
  (:types agent day city)

  (:predicates
    (day ?d - day)
    (next ?d1 - day ?d2 - day)         ; successor relation between days
    (city ?c - city)
    (direct ?from - city ?to - city)   ; direct flight connectivity (directed)
    (at ?a - agent ?c - city ?d - day) ; agent at city on a specific day
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?a ?c ?d1))
              (at ?a ?c ?d2)
            )
  )

  ;; Fly using a direct flight from one city to another between consecutive days
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (not (at ?a ?from ?d1))
              (at ?a ?to ?d2)
            )
  )
)