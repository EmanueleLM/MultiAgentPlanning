(define (domain multiagent-trip)
  (:requirements :strips :typing)
  (:types city agent daycount)
  (:predicates
    (at ?c - city)
    (unvisited ?c - city)
    (visited ?c - city)
    (day ?d - daycount)
    (delta ?from ?to - daycount)
    (direct_flight ?from ?to - city)
    (agent_can_fly ?a - agent ?from ?to - city)
    (responsible ?a - agent ?c - city)
  )

  (:action fly_by_agent
    :parameters (?a - agent ?from ?to - city)
    :precondition (and (at ?from) (direct_flight ?from ?to) (agent_can_fly ?a ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay_in_city_by_agent
    :parameters (?a - agent ?c - city ?from ?to - daycount)
    :precondition (and (at ?c) (unvisited ?c) (responsible ?a ?c) (day ?from) (delta ?from ?to))
    :effect (and
              (visited ?c)
              (not (unvisited ?c))
              (not (day ?from))
              (day ?to)
            )
  )
)