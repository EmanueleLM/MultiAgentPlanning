(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent peg disk place)
  ; pegs and disks are places for the purpose of "on" and "clear"
  ; (peg and disk are both of declared type place to allow on ?d ?p where ?p is either)
  (:predicates
    (on ?d - disk ?p - place)            ; d is directly on place p (p is a disk or a peg)
    (in ?d - disk ?peg - peg)           ; d is located on peg (which peg's stack it belongs to)
    (clear ?p - place)                  ; nothing is directly on p (p may be a disk or a peg)
    (can-move ?a - agent ?d - disk)     ; agent a is allowed to move disk d
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2 (ordering)
  )

  ; Agent 1: moves to an empty peg
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?support - place)
    :precondition (and
      (can-move agent_1 ?d)
      (in ?d ?from)
      (on ?d ?support)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?to)
      (not (in ?d ?from))
      (in ?d ?to)
      (clear ?support)
      (not (clear ?to))
    )
  )

  ; Agent 1: moves onto another disk (destination disk must be clear and larger)
  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?support - place ?tos - disk)
    :precondition (and
      (can-move agent_1 ?d)
      (in ?d ?from)
      (in ?tos ?to)
      (on ?d ?support)
      (clear ?d)
      (clear ?tos)
      (smaller ?d ?tos)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?tos)
      (not (in ?d ?from))
      (in ?d ?to)
      (clear ?support)
      (not (clear ?tos))
    )
  )

  ; Agent 2: moves to an empty peg
  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?support - place)
    :precondition (and
      (can-move agent_2 ?d)
      (in ?d ?from)
      (on ?d ?support)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?to)
      (not (in ?d ?from))
      (in ?d ?to)
      (clear ?support)
      (not (clear ?to))
    )
  )

  ; Agent 2: moves onto another disk
  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?support - place ?tos - disk)
    :precondition (and
      (can-move agent_2 ?d)
      (in ?d ?from)
      (in ?tos ?to)
      (on ?d ?support)
      (clear ?d)
      (clear ?tos)
      (smaller ?d ?tos)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?tos)
      (not (in ?d ?from))
      (in ?d ?to)
      (clear ?support)
      (not (clear ?tos))
    )
  )
)