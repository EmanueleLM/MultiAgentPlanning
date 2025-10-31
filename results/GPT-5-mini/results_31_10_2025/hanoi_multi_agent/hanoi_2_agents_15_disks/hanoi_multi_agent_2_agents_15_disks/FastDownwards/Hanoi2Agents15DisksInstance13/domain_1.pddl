(define (domain hanoi-2agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types support agent peg disk)
  ;; peg and disk are considered supports: declare them as subtypes of support
  ;; (PDDL allows grouping with '-' but to keep this domain straightforward we use support and declare objects appropriately in the problem)
  (:predicates
    (on ?d - disk ?s - support)        ; disk d is directly on support s (a disk or a peg)
    (clear ?s - support)              ; support s has nothing directly on it (no disk on top)
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk)   ; agent a is allowed to move disk d
  )

  ;; Agent 1 actions (moves disks A-H)
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move agent_1 ?d)
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

  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move agent_1 ?d)
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

  ;; Agent 2 actions (moves disks I-O)
  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move agent_2 ?d)
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

  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move agent_2 ?d)
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