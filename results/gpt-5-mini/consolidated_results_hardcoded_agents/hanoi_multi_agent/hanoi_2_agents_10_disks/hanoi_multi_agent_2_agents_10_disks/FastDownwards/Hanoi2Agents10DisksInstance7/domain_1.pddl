(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent peg disk place)
  ; Note: pegs and disks are treated as places for "on" relations.
  (:predicates
    (on ?d - disk ?p - place)            ; disk d is directly on place p (p is a peg or a disk)
    (in ?d - disk ?peg - peg)           ; disk d currently belongs to peg
    (clear ?p - place)                  ; nothing is directly on p (p may be a disk or a peg)
    (can-move ?a - agent ?d - disk)     ; agent a is allowed to move disk d
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2 (ordering)
  )

  ; Agent 1: move disk ?d from ?from peg to empty ?to peg
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

  ; Agent 1: move disk ?d from ?from peg onto disk ?tos on peg ?to
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

  ; Agent 2: move disk ?d from ?from peg to empty ?to peg
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

  ; Agent 2: move disk ?d from ?from peg onto disk ?tos on peg ?to
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