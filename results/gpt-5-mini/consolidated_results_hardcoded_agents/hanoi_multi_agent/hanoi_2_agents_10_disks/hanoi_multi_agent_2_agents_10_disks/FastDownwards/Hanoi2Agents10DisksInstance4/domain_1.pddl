(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; placement predicates
    (on-disk ?d - disk ?under - disk)   ; ?d is directly on disk ?under
    (on-peg  ?d - disk ?p - peg)        ; ?d is directly on peg ?p (bottom disk)

    ;; top/clear predicates
    (clear-disk ?d - disk)              ; no disk directly above ?d
    (clear-peg  ?p - peg)               ; peg ?p has no disks on it

    ;; agent ownership of move capability
    (agent1-disk ?d - disk)
    (agent2-disk ?d - disk)

    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; -------------------
  ;; Actions for agent 1 (may move disks A-E)
  ;; Four move patterns to cover all legal primitive moves
  ;; -------------------

  ;; Move a disk that is directly on another disk, onto another disk
  (:action agent1-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent1-disk ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on another disk, onto an empty peg
  (:action agent1-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?p)
      (agent1-disk ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (not (clear-peg ?p))
      (clear-disk ?from)
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on a peg (bottom disk), onto another disk
  (:action agent1-move-peg-to-disk
    :parameters (?d - disk ?fromp - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?fromp)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent1-disk ?d)
    )
    :effect (and
      (not (on-peg ?d ?fromp))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?fromp)
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on a peg (bottom disk), onto an empty peg
  (:action agent1-move-peg-to-peg
    :parameters (?d - disk ?fromp - peg ?top - peg)
    :precondition (and
      (on-peg ?d ?fromp)
      (clear-disk ?d)
      (clear-peg ?top)
      (agent1-disk ?d)
    )
    :effect (and
      (not (on-peg ?d ?fromp))
      (on-peg ?d ?top)
      (not (clear-peg ?top))
      (clear-peg ?fromp)
      (clear-disk ?d)
    )
  )

  ;; -------------------
  ;; Actions for agent 2 (may move disks F-J)
  ;; Mirror the agent1 actions, restricted to agent2-disk
  ;; -------------------

  (:action agent2-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent2-disk ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
    )
  )

  (:action agent2-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?p)
      (agent2-disk ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (not (clear-peg ?p))
      (clear-disk ?from)
      (clear-disk ?d)
    )
  )

  (:action agent2-move-peg-to-disk
    :parameters (?d - disk ?fromp - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?fromp)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent2-disk ?d)
    )
    :effect (and
      (not (on-peg ?d ?fromp))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?fromp)
      (clear-disk ?d)
    )
  )

  (:action agent2-move-peg-to-peg
    :parameters (?d - disk ?fromp - peg ?top - peg)
    :precondition (and
      (on-peg ?d ?fromp)
      (clear-disk ?d)
      (clear-peg ?top)
      (agent2-disk ?d)
    )
    :effect (and
      (not (on-peg ?d ?fromp))
      (on-peg ?d ?top)
      (not (clear-peg ?top))
      (clear-peg ?fromp)
      (clear-disk ?d)
    )
  )
)