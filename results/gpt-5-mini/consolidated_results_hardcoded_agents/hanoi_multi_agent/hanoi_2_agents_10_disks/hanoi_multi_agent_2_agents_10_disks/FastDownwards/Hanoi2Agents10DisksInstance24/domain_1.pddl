(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    (peg ?p - peg)
    (disk ?d - disk)
    (on ?d - disk ?p - peg)            ; disk ?d is on peg ?p
    (top ?p - peg ?d - disk)          ; disk ?d is the top disk on peg ?p
    (above ?upper - disk ?lower - disk) ; ?upper is directly above ?lower on same peg
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
    (can-move ?ag - agent ?d - disk)  ; agent permission to move disk
  )

  ; ========== agent_1 actions (for disks A..E) ==========
  ; move to empty target, with a disk below on source
  (:action agent_1_move_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?any - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (not (top ?to ?any))
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ; move to empty target, with no disk below on source (source becomes empty)
  (:action agent_1_move_to_empty_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk ?any - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (not (top ?to ?any))
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ; move onto a disk on target, with a disk below on source
  (:action agent_1_move_onto_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?e - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ; move onto a disk on target, with no disk below on source (source becomes empty)
  (:action agent_1_move_onto_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?e - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ; ========== agent_2 actions (for disks F..J) ==========
  ; same schemas but restricted to agent_2 via can-move precondition
  (:action agent_2_move_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?any - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (not (top ?to ?any))
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_to_empty_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk ?any - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (not (top ?to ?any))
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_onto_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?e - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_onto_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?e - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )
)