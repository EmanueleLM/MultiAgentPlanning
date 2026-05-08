(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; direct support relations
    (on-disk ?d - disk ?below - disk)    ; ?d is directly on top of disk ?below
    (on-peg ?d - disk ?p - peg)          ; ?d is directly on peg ?p
    (clear-disk ?d - disk)               ; no disk on top of disk ?d (it is a top disk on its peg)
    (empty-peg ?p - peg)                 ; peg has no disks
    (at ?d - disk ?p - peg)              ; disk ?d is currently on peg ?p (somewhere in its stack)
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is strictly smaller than ?d2 (size order)
    (agent1 ?d - disk)                   ; disk ?d may be moved by agent_1
    (agent2 ?d - disk)                   ; disk ?d may be moved by agent_2
  )

  ;; 4 movement action templates per agent to account for whether a disk is directly on another disk
  ;; or directly on a peg, and whether the target is an empty peg or a disk.

  ;; Agent 1 actions (for disks A-E)
  (:action agent1-move-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (at ?d ?from)
      (empty-peg ?to)
      (agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty-peg ?to))
      (clear-disk ?below)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent1-move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (at ?d ?from)
      (clear-disk ?t)
      (at ?t ?to)
      (smaller ?d ?t)
      (agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (clear-disk ?below)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent1-move-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (empty-peg ?to)
      (at ?d ?from)
      (agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty-peg ?to))
      (empty-peg ?from)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent1-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (at ?t ?to)
      (smaller ?d ?t)
      (at ?d ?from)
      (agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (empty-peg ?from)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  ;; Agent 2 actions (for disks F-J)
  (:action agent2-move-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (at ?d ?from)
      (empty-peg ?to)
      (agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty-peg ?to))
      (clear-disk ?below)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent2-move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (at ?d ?from)
      (clear-disk ?t)
      (at ?t ?to)
      (smaller ?d ?t)
      (agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (clear-disk ?below)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent2-move-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (empty-peg ?to)
      (at ?d ?from)
      (agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty-peg ?to))
      (empty-peg ?from)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action agent2-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (at ?t ?to)
      (smaller ?d ?t)
      (at ?d ?from)
      (agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (empty-peg ?from)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

)