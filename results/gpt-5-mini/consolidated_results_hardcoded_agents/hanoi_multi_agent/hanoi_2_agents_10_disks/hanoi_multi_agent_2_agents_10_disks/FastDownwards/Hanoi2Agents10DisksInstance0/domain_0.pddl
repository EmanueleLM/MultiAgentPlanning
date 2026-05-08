(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; Predicates
  (:predicates
    (on ?d - disk ?s - (either disk peg))  ; disk ?d is immediately on ?s (disk or peg)
    (clear ?o - (either disk peg))         ; nothing on top of ?o (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)       ; ?d1 is smaller than ?d2 (allowed to place ?d1 on ?d2)
    (agent1_disk ?d - disk)               ; permission: agent_1 may move this disk
    (agent2_disk ?d - disk)               ; permission: agent_2 may move this disk
  )

  ;; ===== Agent 1 actions (may only move A-E) =====
  ;; from = disk, to = disk
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

  ;; from = disk, to = peg
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

  ;; from = peg, to = disk
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

  ;; from = peg, to = peg
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

  ;; ===== Agent 2 actions (may only move F-J) =====
  ;; from = disk, to = disk
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

  ;; from = disk, to = peg
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

  ;; from = peg, to = disk
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

  ;; from = peg, to = peg
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