(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?x - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  ;; Agent 1: move disk to an empty peg
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
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
    :parameters (?d - disk ?from - (either disk peg) ?onto - disk)
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
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
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
    :parameters (?d - disk ?from - (either disk peg) ?onto - disk)
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