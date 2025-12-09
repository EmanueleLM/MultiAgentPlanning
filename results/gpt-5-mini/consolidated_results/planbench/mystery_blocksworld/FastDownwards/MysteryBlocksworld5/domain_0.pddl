(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent place phase)

  (:predicates
    (at ?o - object ?p - place)                 ; object at a place
    (at-agent ?ag - agent ?p - place)           ; agent at a place
    (held ?o - object)                          ; object is held by some agent
    (held-by ?o - object ?ag - agent)           ; object is held by a specific agent
    (other ?o1 - object ?o2 - object)           ; explicit "other object" relation
    (phase ?ph - phase)                         ; current phase marker
    (phase-successor ?p1 - phase ?p2 - phase)   ; allowed phase successor relation
    (craves ?o1 - object ?o2 - object)          ; craving relation: o1 craves o2
  )

  ;; Agent 1: picks an object at its current place and advances phase (p -> successor)
  (:action agent1_pick
    :parameters (?ag - agent ?o - object ?place - place ?ph - phase ?ph-next - phase)
    :precondition (and
      (phase ?ph)
      (phase-successor ?ph ?ph-next)
      (at ?o ?place)
      (at-agent ?ag ?place)
      (not (held ?o))
    )
    :effect (and
      (held ?o)
      (held-by ?o ?ag)
      (not (at ?o ?place))
      (not (phase ?ph))
      (phase ?ph-next)
    )
  )

  ;; Agent 1: move while holding an object (does not change phase)
  (:action agent1_move
    :parameters (?ag - agent ?o - object ?from - place ?to - place ?ph - phase)
    :precondition (and
      (phase ?ph)
      (at-agent ?ag ?from)
      (held-by ?o ?ag)
    )
    :effect (and
      (at-agent ?ag ?to)
      (not (at-agent ?ag ?from))
    )
  )

  ;; Agent 1: drop a held object at the place where a receiver object is located; advance phase
  (:action agent1_drop
    :parameters (?ag - agent ?o - object ?receiver - object ?place - place ?ph - phase ?ph-next - phase)
    :precondition (and
      (phase ?ph)
      (phase-successor ?ph ?ph-next)
      (held-by ?o ?ag)
      (at-agent ?ag ?place)
      (at ?receiver ?place)
    )
    :effect (and
      (not (held-by ?o ?ag))
      (not (held ?o))
      (at ?o ?place)
      (not (phase ?ph))
      (phase ?ph-next)
    )
  )

  ;; Agent 3: persuade / induce craving when two objects are co-located and agent 3 is present; advance phase
  (:action agent3_persuade
    :parameters (?ag - agent ?receiver - object ?target - object ?place - place ?ph - phase ?ph-next - phase)
    :precondition (and
      (phase ?ph)
      (phase-successor ?ph ?ph-next)
      (at ?receiver ?place)
      (at ?target ?place)
      (at-agent ?ag ?place)
      (not (craves ?receiver ?target))
    )
    :effect (and
      (craves ?receiver ?target)
      (not (phase ?ph))
      (phase ?ph-next)
    )
  )
)