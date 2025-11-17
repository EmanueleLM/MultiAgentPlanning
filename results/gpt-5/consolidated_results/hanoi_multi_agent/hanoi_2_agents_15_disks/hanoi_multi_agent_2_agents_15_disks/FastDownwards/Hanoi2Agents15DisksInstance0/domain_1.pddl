(define (domain hanoi-2agents-15)
  ; Tower of Hanoi with 15 disks, 3 pegs, and two agent-specific move operators.
  ; Constraints:
  ; - One-disk moves only.
  ; - A disk may be placed only on an empty peg or atop a strictly larger disk.
  ; - Ownership: agent_1 may move only A–H; agent_2 may move only I–O.
  ; Implementation notes:
  ; - We use a supertype "support" so disks can be on either a peg or a disk.
  ; - The static predicate can-stack(d, s) is true for all pegs and for disk pairs
  ;   exactly when (smaller d s) holds, avoiding ADL disjunctions.
  (:requirements :strips :typing)

  (:types
    support
    disk peg - support
  )

  (:predicates
    (on ?x - disk ?s - support)      ; disk x is directly on support s
    (clear ?s - support)             ; no disk on top of support s
    (smaller ?x - disk ?y - disk)    ; x is strictly smaller than y (static)
    (can-stack ?x - disk ?s - support) ; legal to place x onto s (static)
    (owned-a1 ?x - disk)             ; disks movable by agent_1
    (owned-a2 ?x - disk)             ; disks movable by agent_2
  )

  (:action move-a1
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (owned-a1 ?d)
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

  (:action move-a2
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (owned-a2 ?d)
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