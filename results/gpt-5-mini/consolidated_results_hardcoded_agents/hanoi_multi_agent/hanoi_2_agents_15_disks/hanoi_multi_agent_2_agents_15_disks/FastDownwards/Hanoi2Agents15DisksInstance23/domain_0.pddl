(define (domain hanoi-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1-allowed ?d - disk)
    (agent2-allowed ?d - disk)
  )

  ;; Agent 1 actions (allowed to move disks A..H)
  (:action agent1-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent1-allowed ?d))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent1-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent1-allowed ?d))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent1-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent1-allowed ?d))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action agent1-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent1-allowed ?d))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Agent 2 actions (allowed to move disks I..O)
  (:action agent2-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent2-allowed ?d))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent2-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent2-allowed ?d))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent2-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent2-allowed ?d))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action agent2-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent2-allowed ?d))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

)