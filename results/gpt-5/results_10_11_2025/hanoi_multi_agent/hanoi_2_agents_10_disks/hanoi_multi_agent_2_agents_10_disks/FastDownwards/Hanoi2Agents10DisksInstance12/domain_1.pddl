(define (domain hanoi-2agent-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    ; support bookkeeping
    (clear ?s - support)                ; nothing is on top of support s
    (on ?d - disk ?s - support)         ; disk d is directly on support s (peg or disk)

    ; size and authorization
    (smaller ?x - disk ?y - disk)       ; x is strictly smaller than y
    (can-move ?a - agent ?d - disk)     ; agent a is authorized to move disk d

    ; admissible placements (either onto any peg, or onto a strictly larger disk)
    (can-stack ?d - disk ?s - support)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)