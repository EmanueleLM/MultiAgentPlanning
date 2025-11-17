(define (domain hanoi-3agent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg agent
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk)             ; ?d1 is directly on ?d2
    (on-peg ?d - disk ?p - peg)            ; ?d is directly on peg ?p (no disk beneath)
    (clear ?x - (either disk peg))         ; disk/peg has nothing on it (top/empty)
    (smaller ?d1 - disk ?d2 - disk)        ; d1 is smaller than d2 (legal to place d1 on d2)
    (allowed ?a - agent ?d - disk)         ; agent a is allowed to move disk d
    (top ?p - peg ?d - disk)               ; optional: top disk of peg p (not required by actions)
  )

  ; move a clear disk from atop another disk onto a larger clear disk
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; move a clear disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p-from - peg ?p-to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p-from)
      (clear ?d)
      (clear ?p-to)
    )
    :effect (and
      (not (on-peg ?d ?p-from))
      (on-peg ?d ?p-to)
      (clear ?p-from)
      (not (clear ?p-to))
    )
  )

  ; move a clear disk that is directly on a peg onto a larger clear disk
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?to - disk)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on ?d ?to)
      (clear ?p)
      (not (clear ?to))
    )
  )

  ; move a clear disk from atop another disk to an empty peg
  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?p - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )
)