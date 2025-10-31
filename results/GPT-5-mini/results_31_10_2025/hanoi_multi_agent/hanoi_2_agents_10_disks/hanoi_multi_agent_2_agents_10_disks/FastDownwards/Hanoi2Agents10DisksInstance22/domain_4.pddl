(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  ;; Agent 1 actions
  (:action move_agent1_from_disk_to_peg
    :parameters (?d ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent1_from_peg_to_peg
    :parameters (?d - disk ?from ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent1_from_disk_to_disk
    :parameters (?d ?from ?onto - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?onto)
      (smaller ?d ?onto)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?onto)
      (clear-disk ?from)
      (not (clear-disk ?onto))
      (clear-disk ?d)
    )
  )

  (:action move_agent1_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?onto - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?onto)
      (smaller ?d ?onto)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?onto)
      (clear-peg ?from)
      (not (clear-disk ?onto))
      (clear-disk ?d)
    )
  )

  ;; Agent 2 actions
  (:action move_agent2_from_disk_to_peg
    :parameters (?d ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent2_from_peg_to_peg
    :parameters (?d - disk ?from ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent2_from_disk_to_disk
    :parameters (?d ?from ?onto - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?onto)
      (smaller ?d ?onto)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?onto)
      (clear-disk ?from)
      (not (clear-disk ?onto))
      (clear-disk ?d)
    )
  )

  (:action move_agent2_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?onto - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?onto)
      (smaller ?d ?onto)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?onto)
      (clear-peg ?from)
      (not (clear-disk ?onto))
      (clear-disk ?d)
    )
  )
)