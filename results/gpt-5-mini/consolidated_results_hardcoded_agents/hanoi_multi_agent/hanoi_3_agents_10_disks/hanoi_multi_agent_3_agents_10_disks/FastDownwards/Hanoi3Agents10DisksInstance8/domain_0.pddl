(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (above ?upper - disk ?lower - disk) ; upper is directly above lower on same peg
    (bottom ?d - disk ?p - peg) ; disk is bottom disk on peg
    (peg-empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk)
  )

  ; -----------------------
  ; Actions for agent_1
  ; -----------------------

  ;; Move agent_1: move a top disk that has a disk below it, onto an empty peg
  (:action agent_1-move-to-empty-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (peg-empty ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg-empty ?to))
      (not (above ?d ?below))
      (top ?below ?from)
    )
  )

  ;; Move agent_1: move a top disk that is also bottom (only disk on its peg), onto an empty peg
  (:action agent_1-move-to-empty-bottom
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (peg-empty ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (bottom ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
    )
  )

  ;; Move agent_1: move a top disk that has a disk below it, onto a non-empty peg (onto top ?t)
  (:action agent_1-move-to-disk-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (above ?d ?below))
      (top ?below ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

  ;; Move agent_1: move a top disk that is also bottom, onto a non-empty peg (onto top ?t)
  (:action agent_1-move-to-disk-bottom
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (peg-empty ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

  ; -----------------------
  ; Actions for agent_2 (same structure, restricted to agent_2)
  ; -----------------------

  (:action agent_2-move-to-empty-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (peg-empty ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg-empty ?to))
      (not (above ?d ?below))
      (top ?below ?from)
    )
  )

  (:action agent_2-move-to-empty-bottom
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (peg-empty ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (bottom ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
    )
  )

  (:action agent_2-move-to-disk-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (above ?d ?below))
      (top ?below ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

  (:action agent_2-move-to-disk-bottom
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (peg-empty ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

  ; -----------------------
  ; Actions for agent_3 (same structure, restricted to agent_3)
  ; -----------------------

  (:action agent_3-move-to-empty-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (peg-empty ?to)
      (can-move agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg-empty ?to))
      (not (above ?d ?below))
      (top ?below ?from)
    )
  )

  (:action agent_3-move-to-empty-bottom
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (peg-empty ?to)
      (can-move agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (bottom ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
    )
  )

  (:action agent_3-move-to-disk-with-below
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (above ?d ?below))
      (top ?below ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

  (:action agent_3-move-to-disk-bottom
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (can-move agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (bottom ?d ?from))
      (peg-empty ?from)
      (not (top ?t ?to))
      (above ?d ?t)
    )
  )

)