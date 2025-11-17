(define (domain hanoi3agents_domain_v2)
  (:requirements :strips :typing)
  (:types disk peg agent)
  (:predicates
    ; stacking and location
    (on ?d - disk ?u - disk)            ; d is directly on disk u
    (on-peg ?d - disk ?p - peg)         ; d is directly on peg p (bottom of stack)
    (in-peg ?d - disk ?p - peg)         ; d is somewhere in peg p (any depth)

    ; availability
    (clear ?d - disk)                   ; no disk on d
    (clear-peg ?p - peg)                ; peg p has no disks

    ; ordering and permissions
    (smaller ?x - disk ?y - disk)       ; x is smaller than y
    (can-move ?a - agent ?d - disk)     ; agent a is permitted to move disk d
  )

  ; Move a single, clear disk that is the only disk on its source peg to an empty target peg
  (:action move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (clear-peg ?from)
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to)
    )
  )

  ; Move a single, clear disk that currently sits on another disk to an empty target peg
  (:action move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?u)
      (in-peg ?u ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to)
    )
  )

  ; Move a single, clear disk that is the only disk on its source peg onto a clear disk on the target peg
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (in-peg ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (clear-peg ?from)
      (on ?d ?t)
      (not (clear ?t))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to)
    )
  )

  ; Move a single, clear disk that currently sits on another disk onto a clear disk on the target peg
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u - disk ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?u)
      (in-peg ?u ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (in-peg ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (on ?d ?t)
      (not (clear ?t))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to)
    )
  )
)