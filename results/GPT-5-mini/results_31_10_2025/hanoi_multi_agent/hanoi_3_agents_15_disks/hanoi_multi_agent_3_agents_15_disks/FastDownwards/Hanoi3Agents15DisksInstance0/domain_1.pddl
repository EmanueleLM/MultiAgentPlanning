(define (domain hanoi-3agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)       ; disk ?d is directly on disk ?under
    (on-peg ?d - disk ?p - peg)             ; disk ?d is directly on peg ?p
    (clear-disk ?d - disk)                  ; no disk on top of ?d
    (clear-peg ?p - peg)                    ; peg ?p has no disk on it
    (smaller ?d1 - disk ?d2 - disk)         ; ?d1 is strictly smaller than ?d2
    (allowed ?a - agent ?d - disk)          ; agent ?a is allowed to move disk ?d
  )

  ;; Move a disk that currently sits on a disk, onto another disk
  (:action move-disk-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed ?ag ?d)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Move a disk that currently sits on a disk, onto a (clear) peg
  (:action move-disk-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?p - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?p)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (clear-disk ?from)
      (not (clear-peg ?p))
    )
  )

  ;; Move a disk that currently sits on a peg, onto another disk
  (:action move-disk-peg-to-disk
    :parameters (?ag - agent ?d - disk ?p - peg ?to - disk)
    :precondition (and
      (allowed ?ag ?d)
      (on-peg ?d ?p)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-disk ?d ?to)
      (clear-peg ?p)
      (not (clear-disk ?to))
    )
  )

  ;; Move a disk that currently sits on a peg, onto another (clear) peg
  (:action move-disk-peg-to-peg
    :parameters (?ag - agent ?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on-peg ?d ?pfrom)
      (clear-disk ?d)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)
      (clear-peg ?pfrom)
      (not (clear-peg ?pto))
    )
  )
)