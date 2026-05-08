(define (domain hanoi_two_agents_10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk on a peg
    (on-peg ?d - disk ?p - peg)
    ; disk on another disk
    (on-disk ?d - disk ?sd - disk)
    ; a disk is clear (no disk on top of it)
    (clear-disk ?d - disk)
    ; a peg is clear (no disk resting directly on it)
    (clear-peg ?p - peg)
    ; which agent may move which disk
    (agent1-can-move ?d - disk)
    (agent2-can-move ?d - disk)
    ; size ordering: smaller ?d1 ?d2 is true when ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; ---------- Actions for agent_1 ----------
  ; move from top-of-peg to an empty peg
  (:action move-agent1-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent1-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ; move from on-top-of-disk to an empty peg
  (:action move-agent1-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent1-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ; move from top-of-peg to onto another disk (respect size)
  (:action move-agent1-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent1-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ; move from on-top-of-disk to onto another disk (respect size)
  (:action move-agent1-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent1-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ; ---------- Actions for agent_2 ----------
  ; move from top-of-peg to an empty peg
  (:action move-agent2-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent2-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ; move from on-top-of-disk to an empty peg
  (:action move-agent2-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent2-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ; move from top-of-peg to onto another disk (respect size)
  (:action move-agent2-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent2-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ; move from on-top-of-disk to onto another disk (respect size)
  (:action move-agent2-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent2-can-move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )
)