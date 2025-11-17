(define (domain hanoi-2agents)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    ; disk on object (disk or peg)
    (on ?d - disk ?x - object)
    ; nothing directly on the object (object = disk or peg)
    (clear ?x - object)
    ; size ordering: (smaller a b) means a smaller than b
    (smaller ?a - disk ?b - disk)
    ; which agent may move which disk
    (can_move_agent_1 ?d - disk)
    (can_move_agent_2 ?d - disk)
  )

  ; Agent 1: move a disk onto another disk (must be smaller than target disk)
  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can_move_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Agent 1: move a disk onto a peg
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can_move_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Agent 2: move a disk onto another disk (must be smaller than target disk)
  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can_move_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Agent 2: move a disk onto a peg
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can_move_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)