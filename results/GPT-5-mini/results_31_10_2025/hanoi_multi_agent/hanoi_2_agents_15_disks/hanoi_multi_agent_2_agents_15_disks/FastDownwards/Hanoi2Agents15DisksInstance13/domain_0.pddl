(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types support peg disk agent)

  (:predicates
    (on ?d - disk ?s - support)           ; disk d is directly on support s (peg or disk)
    (clear ?s - support)                 ; support s has nothing directly on it (no disk on top)
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk)      ; agent a is allowed (and, per private info, will) move disk d
  )

  ;; Agent 1 actions (prefix with agent1_)
  (:action agent1_move_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action agent1_move_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2 actions (kept distinct; will be disabled by absence of can-move facts for agent2)
  (:action agent2_move_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action agent2_move_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)