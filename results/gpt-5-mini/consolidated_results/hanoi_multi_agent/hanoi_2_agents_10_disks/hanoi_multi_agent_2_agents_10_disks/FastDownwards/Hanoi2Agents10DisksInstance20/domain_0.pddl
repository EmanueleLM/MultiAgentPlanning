(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg agent)
  (:predicates
    (on ?d - disk ?s - object)          ; disk ?d is directly on object ?s (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2
    (can-move ?a - agent ?d - disk)    ; agent ?a is permitted to move disk ?d
  )

  ;; Agent 1: move a top disk onto an empty peg
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (can-move agent_1 ?d)
      ;; ?d must be top: no disk on ?d
      (not (on A ?d)) (not (on B ?d)) (not (on C ?d)) (not (on D ?d)) (not (on E ?d))
      (not (on F ?d)) (not (on G ?d)) (not (on H ?d)) (not (on I ?d)) (not (on J ?d))
      ;; ?to peg must be empty (no disk on that peg)
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Agent 1: move a top disk onto another top disk (must be larger)
  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (can-move agent_1 ?d)
      ;; ?d must be top
      (not (on A ?d)) (not (on B ?d)) (not (on C ?d)) (not (on D ?d)) (not (on E ?d))
      (not (on F ?d)) (not (on G ?d)) (not (on H ?d)) (not (on I ?d)) (not (on J ?d))
      ;; ?to must be top (so disk will be placed on its top)
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      ;; size constraint: moving disk must be smaller than target disk
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Agent 2: move a top disk onto an empty peg
  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (can-move agent_2 ?d)
      ;; ?d must be top
      (not (on A ?d)) (not (on B ?d)) (not (on C ?d)) (not (on D ?d)) (not (on E ?d))
      (not (on F ?d)) (not (on G ?d)) (not (on H ?d)) (not (on I ?d)) (not (on J ?d))
      ;; ?to peg must be empty
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Agent 2: move a top disk onto another top disk (must be larger)
  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (can-move agent_2 ?d)
      ;; ?d must be top
      (not (on A ?d)) (not (on B ?d)) (not (on C ?d)) (not (on D ?d)) (not (on E ?d))
      (not (on F ?d)) (not (on G ?d)) (not (on H ?d)) (not (on I ?d)) (not (on J ?d))
      ;; ?to must be top
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      ;; size constraint
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

)