(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk is immediately on (another disk or a peg)
    (on ?d - disk ?s - (either disk peg))
    ;; nothing on top of this disk or peg
    (clear ?o - (either disk peg))
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; permissions
    (agent1_disk ?d - disk)
    (agent2_disk ?d - disk)
  )

  ;; ===== Agent 1 actions (may only move disks A-E) =====

  ;; Move a disk onto another disk (requires smaller)
  (:action move-agent1-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent1_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a disk to a peg
  (:action move-agent1-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent1_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a peg onto a disk (requires smaller)
  (:action move-agent1-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent1_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a peg to a peg
  (:action move-agent1-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent1_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; ===== Agent 2 actions (may only move disks F-J) =====

  ;; Move a disk onto another disk (requires smaller)
  (:action move-agent2-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent2_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a disk to a peg
  (:action move-agent2-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent2_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a peg onto a disk (requires smaller)
  (:action move-agent2-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent2_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk from a peg to a peg
  (:action move-agent2-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent2_disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

)