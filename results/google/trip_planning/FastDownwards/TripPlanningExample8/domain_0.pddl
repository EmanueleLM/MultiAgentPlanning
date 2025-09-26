(define (domain multiagent-itinerary)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  ;; Fly along a permitted direct flight from one day to the next
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?a ?to ?d2))
  )
)