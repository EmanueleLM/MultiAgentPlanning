(define (domain hanoi2agents15disks)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk - support
    peg - support
  )
  (:predicates
    (on ?d - disk ?p - peg)                  ; disk d is (somewhere) on peg p
    (on-direct ?d - disk ?s - support)       ; disk d is directly resting on support s (a disk or a peg)
    (clear ?s - support)                     ; support s has nothing on it (for a peg: it has no bottom disk; for a disk: no disk atop)
    (smaller ?x - disk ?y - disk)            ; x is strictly smaller than y
    (allowed ?a - agent ?d - disk)           ; agent a may move disk d
  )

  ; Move a clear/top disk to an empty peg
  (:action move-to-empty
    :parameters (?d - disk ?u - support ?from - peg ?to - peg ?a - agent)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (on-direct ?d ?u)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on-direct ?d ?u))
      (on-direct ?d ?to)
      (clear ?u)
      (not (clear ?to))
    )
  )

  ; Move a clear/top disk onto a larger clear top disk on the target peg
  (:action move-onto
    :parameters (?d - disk ?u - support ?from - peg ?to - peg ?t - disk ?a - agent)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (on-direct ?d ?u)
      (clear ?d)
      (on ?t ?to)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on-direct ?d ?u))
      (on-direct ?d ?t)
      (clear ?u)
      (not (clear ?t))
    )
  )
)