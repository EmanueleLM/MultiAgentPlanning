(define (domain multiagent-travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (day ?d - day)
    (next ?d1 ?d2 - day)
    (agent ?a - agent)
    (city ?c - city)
    (direct ?from ?to - city)            ; direct flight availability between cities
    (at ?a - agent ?c - city ?d - day)   ; agent is in a city on a specific day
    (visited ?a - agent ?c - city)       ; agent has visited a city sometime
    (show ?c - city ?d - day)            ; show/event scheduled in a city on a given day
  )

  ;; Travel action: use a direct flight from one city to another, consuming one day step.
  (:action travel
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (at ?a ?from ?d1)
                    (direct ?from ?to)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (at ?a ?to ?d2)
              (visited ?a ?to)
            )
  )

  ;; Stay action: remain in the same city for the next day.
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (at ?a ?c ?d1)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (at ?a ?c ?d2)
              (visited ?a ?c)
            )
  )
)