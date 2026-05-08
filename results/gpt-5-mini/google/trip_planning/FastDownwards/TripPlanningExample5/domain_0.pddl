(define (domain travel-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent day city)

  (:predicates
    (next ?d1 - day ?d2 - day)               ; successor relation between days
    (day ?d - day)
    (city ?c - city)
    (traveler ?a - agent)                   ; marks traveler agents
    (orchestrator ?a - agent)               ; marks orchestrator agents
    (direct ?from - city ?to - city)        ; static: direct-flight connectivity
    (at ?a - agent ?c - city ?d - day)      ; agent is at city on given day
  )

  ;; ACTIONS FOR TRAVELER (conceptually distinct)
  (:action stay_traveler
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (traveler ?a)
                    (at ?a ?c ?d1)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (not (at ?a ?c ?d1))
              (at ?a ?c ?d2)
            )
  )

  (:action fly_traveler
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (traveler ?a)
                    (at ?a ?from ?d1)
                    (direct ?from ?to)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (not (at ?a ?from ?d1))
              (at ?a ?to ?d2)
            )
  )

  ;; ACTIONS FOR ORCHESTRATOR (kept distinct even if not required to move)
  (:action stay_orchestrator
    :parameters (?o - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (orchestrator ?o)
                    (at ?o ?c ?d1)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (not (at ?o ?c ?d1))
              (at ?o ?c ?d2)
            )
  )

  (:action fly_orchestrator
    :parameters (?o - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (orchestrator ?o)
                    (at ?o ?from ?d1)
                    (direct ?from ?to)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (not (at ?o ?from ?d1))
              (at ?o ?to ?d2)
            )
  )
)