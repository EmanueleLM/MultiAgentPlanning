(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj disk peg agent)

  (:predicates
    (on ?d - disk ?x - obj)            ; disk directly on an object (disk or peg)
    (clear ?x - obj)                  ; nothing on top of this object
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    (can-move-agent1 ?d - disk)       ; agent_1 is allowed to move this disk
    (can-move-agent2 ?d - disk)       ; agent_2 is allowed to move this disk
  )

  ;; Agent 1: move disk to an empty peg
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - obj ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: move disk onto another disk (target must be larger)
  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - obj ?onto - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (clear ?from)
      (not (clear ?onto))
    )
  )

  ;; Agent 2: move disk to an empty peg
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - obj ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move disk onto another disk (target must be larger)
  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - obj ?onto - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (clear ?from)
      (not (clear ?onto))
    )
  )
)