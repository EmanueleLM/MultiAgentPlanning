(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-top ?d - disk ?p - peg)        ; ?d is the top disk on peg ?p
    (above ?d - disk ?e - disk)        ; ?d is immediately above ?e
    (on-base ?d - disk ?p - peg)       ; ?d is directly on the base of peg ?p (no disk below)
    (peg-empty ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static)
    (agent1-allowed ?d - disk)         ; agent_1 is allowed to move ?d (static)
    (agent2-allowed ?d - disk)         ; agent_2 is allowed to move ?d (static)
  )

  ; ==== Agent 1 actions (disks A..E only) ====
  ; Move a top disk that has a disk below it, to an empty peg
  (:action agent1-move-with-below-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-top ?d ?from)
      (above ?d ?below)
      (peg-empty ?to)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (above ?d ?below))
      (on-top ?below ?from)
      (not (peg-empty ?to))
      (on-top ?d ?to)
      (on-base ?d ?to)
    )
  )

  ; Move a top disk that is the only disk on its peg (on-base), to an empty peg
  (:action agent1-move-no-below-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-top ?d ?from)
      (on-base ?d ?from)
      (peg-empty ?to)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (on-base ?d ?from))
      (peg-empty ?from)
      (not (peg-empty ?to))
      (on-top ?d ?to)
      (on-base ?d ?to)
    )
  )

  ; Move a top disk that has a disk below it, onto a non-empty peg whose top is ?t (must be larger)
  (:action agent1-move-with-below-onto
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on-top ?d ?from)
      (above ?d ?below)
      (on-top ?t ?to)
      (smaller ?d ?t)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (above ?d ?below))
      (on-top ?below ?from)
      (not (on-top ?t ?to))
      (above ?d ?t)
      (on-top ?d ?to)
    )
  )

  ; Move a top disk that is the only disk on its peg, onto a non-empty peg whose top is ?t (must be larger)
  (:action agent1-move-no-below-onto
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on-top ?d ?from)
      (on-base ?d ?from)
      (on-top ?t ?to)
      (smaller ?d ?t)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (on-base ?d ?from))
      (peg-empty ?from)
      (not (on-top ?t ?to))
      (above ?d ?t)
      (on-top ?d ?to)
    )
  )

  ; ==== Agent 2 actions (disks F..J only) ====
  ; Analogous actions for agent_2, with the same structural effects but restricted to agent2-allowed disks
  (:action agent2-move-with-below-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-top ?d ?from)
      (above ?d ?below)
      (peg-empty ?to)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (above ?d ?below))
      (on-top ?below ?from)
      (not (peg-empty ?to))
      (on-top ?d ?to)
      (on-base ?d ?to)
    )
  )

  (:action agent2-move-no-below-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-top ?d ?from)
      (on-base ?d ?from)
      (peg-empty ?to)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (on-base ?d ?from))
      (peg-empty ?from)
      (not (peg-empty ?to))
      (on-top ?d ?to)
      (on-base ?d ?to)
    )
  )

  (:action agent2-move-with-below-onto
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on-top ?d ?from)
      (above ?d ?below)
      (on-top ?t ?to)
      (smaller ?d ?t)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (above ?d ?below))
      (on-top ?below ?from)
      (not (on-top ?t ?to))
      (above ?d ?t)
      (on-top ?d ?to)
    )
  )

  (:action agent2-move-no-below-onto
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on-top ?d ?from)
      (on-base ?d ?from)
      (on-top ?t ?to)
      (smaller ?d ?t)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on-top ?d ?from))
      (not (on-base ?d ?from))
      (peg-empty ?from)
      (not (on-top ?t ?to))
      (above ?d ?t)
      (on-top ?d ?to)
    )
  )
)