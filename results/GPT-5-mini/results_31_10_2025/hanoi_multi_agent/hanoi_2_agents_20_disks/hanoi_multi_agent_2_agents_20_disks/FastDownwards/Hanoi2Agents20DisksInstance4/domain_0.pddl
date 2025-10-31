(define (domain tower-hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
  )

  ;; Agent 1 move actions (Agent 1 is the only agent permitted to move disks; Agent 2 has no move operators)
  ;; Move a disk that is directly on a peg to an empty peg
  (:action move_agent1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk
  (:action move_agent1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a disk that is on another disk to an empty peg
  (:action move_agent1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a disk that is on another disk onto another disk
  (:action move_agent1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

) ; end domain