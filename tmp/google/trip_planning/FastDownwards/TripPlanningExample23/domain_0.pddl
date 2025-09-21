(define (domain multi-agent-trip)
  (:requirements :strips :typing :fluents :numeric-fluents)
  (:types agent city)

  (:predicates
    (at ?ag - agent ?c - city)
    (flight ?from - city ?to - city)        ; direct flight exists (only direct flights may be used)
    (workshop ?c - city)                   ; workshop scheduled in city
    (attended-workshop ?ag - agent)        ; per-agent workshop attendance flag
    (visited ?ag - agent ?c - city)        ; per-agent visited city flag
  )

  (:functions
    (day)                                   ; current day (integer). Days run from 1 .. 8 in this problem.
    (stay-days ?c - city)                   ; accumulated stay-days per city (aggregated across agents)
  )

  ;; Agent 1 actions (kept distinct from agent 2 actions)
  (:action fly-agent1
    :parameters (?from - city ?to - city)
    :precondition (and
      (at agent1 ?from)
      (flight ?from ?to)
      (<= (day) 8)
    )
    :effect (and
      (not (at agent1 ?from))
      (at agent1 ?to)
      (visited agent1 ?to)
      (increase (day) 1)
      (increase (stay-days ?to) 1)
    )
  )

  (:action stay-agent1
    :parameters (?c - city)
    :precondition (and
      (at agent1 ?c)
      (<= (day) 8)
    )
    :effect (and
      (increase (day) 1)
      (increase (stay-days ?c) 1)
      (visited agent1 ?c)
    )
  )

  (:action attend-agent1
    :parameters (?c - city)
    :precondition (and
      (at agent1 ?c)
      (workshop ?c)
      (>= (day) 5)
      (<= (day) 8)
    )
    :effect (and
      (attended-workshop agent1)
      (increase (day) 1)
      (increase (stay-days ?c) 1)
    )
  )

  ;; Agent 2 actions (kept distinct from agent 1 actions)
  (:action fly-agent2
    :parameters (?from - city ?to - city)
    :precondition (and
      (at agent2 ?from)
      (flight ?from ?to)
      (<= (day) 8)
    )
    :effect (and
      (not (at agent2 ?from))
      (at agent2 ?to)
      (visited agent2 ?to)
      (increase (day) 1)
      (increase (stay-days ?to) 1)
    )
  )

  (:action stay-agent2
    :parameters (?c - city)
    :precondition (and
      (at agent2 ?c)
      (<= (day) 8)
    )
    :effect (and
      (increase (day) 1)
      (increase (stay-days ?c) 1)
      (visited agent2 ?c)
    )
  )

  (:action attend-agent2
    :parameters (?c - city)
    :precondition (and
      (at agent2 ?c)
      (workshop ?c)
      (>= (day) 5)
      (<= (day) 8)
    )
    :effect (and
      (attended-workshop agent2)
      (increase (day) 1)
      (increase (stay-days ?c) 1)
    )
  )
)