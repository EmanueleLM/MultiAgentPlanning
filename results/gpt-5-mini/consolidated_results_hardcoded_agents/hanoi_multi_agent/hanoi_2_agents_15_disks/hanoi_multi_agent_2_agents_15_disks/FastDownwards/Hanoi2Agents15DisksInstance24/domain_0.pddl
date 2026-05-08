(define (domain tower_hanoi_two_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?p - peg)                 ; disk ?d is on peg ?p
    (top ?p - peg ?d - disk)               ; ?d is the top disk on peg ?p
    (empty ?p - peg)                       ; peg ?p is empty (no disks)
    (smaller ?d1 - disk ?d2 - disk)        ; ?d1 is smaller than ?d2
    (allowed_move ?a - agent ?d - disk ?from - peg ?to - peg) ; primitive move allowance
  )

  ;; Agent 1 moves a disk from a peg to an empty peg (uses allowed_move to restrict to provided primitives)
  (:action move_agent_1_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (allowed_move agent1 ?d ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Agent 1 moves a disk onto another disk (destination has a top disk that must be larger)
  (:action move_agent_1_on_top
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (allowed_move agent1 ?d ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?d2))
      (empty ?from)
    )
  )

  ;; Agent 2 actions are present but require explicit allowed_move facts for agent2 which are not provided
  (:action move_agent_2_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (allowed_move agent2 ?d ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent_2_on_top
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (allowed_move agent2 ?d ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?d2))
      (empty ?from)
    )
  )
)