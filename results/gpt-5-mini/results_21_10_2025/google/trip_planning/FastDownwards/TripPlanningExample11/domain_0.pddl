(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (at ?ag - agent ?c - city ?d - day)      ; agent is at city on day
    (connected ?from - city ?to - city)     ; direct flight connection
    (next ?d1 - day ?d2 - day)              ; successor day relation
    (occupied ?d - day)                     ; day has already been assigned a location
  )

  ;; Stay in the same city from previous day to current day
  (:action stay
    :parameters (?ag - agent ?c - city ?dprev - day ?dcur - day)
    :precondition (and
      (at ?ag ?c ?dprev)
      (next ?dprev ?dcur)
      (not (occupied ?dcur))
    )
    :effect (and
      (at ?ag ?c ?dcur)
      (occupied ?dcur)
    )
  )

  ;; Fly directly between two cities (only allowed if connected)
  (:action fly
    :parameters (?ag - agent ?from - city ?to - city ?dprev - day ?dcur - day)
    :precondition (and
      (at ?ag ?from ?dprev)
      (connected ?from ?to)
      (next ?dprev ?dcur)
      (not (occupied ?dcur))
    )
    :effect (and
      (at ?ag ?to ?dcur)
      (occupied ?dcur)
    )
  )
)