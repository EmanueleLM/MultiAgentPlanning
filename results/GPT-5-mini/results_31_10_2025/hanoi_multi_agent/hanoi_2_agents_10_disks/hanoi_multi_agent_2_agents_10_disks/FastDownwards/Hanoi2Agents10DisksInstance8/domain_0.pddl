(define (domain hanoi-dualagents)
  (:requirements :strips :typing :negative-preconditions)
  (:types support disk peg)
  ;; disk is subtype of support, peg is subtype of support
  ;; Note: In PDDL typing, this is declared as "disk - support peg - support"
  (:predicates
    (on ?d - disk ?s - support)        ; disk d is on support s (peg or disk)
    (clear ?s - support)               ; support s has nothing on top
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (can-move-agent1 ?d - disk)        ; agent_1 allowed to move disk
    (can-move-agent2 ?d - disk)        ; agent_2 allowed to move disk
  )

  ;; Agent 1 actions: can move only disks with (can-move-agent1 ?d)
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 actions: can move only disks with (can-move-agent2 ?d)
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)