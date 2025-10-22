(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)   ; ?d is directly on top of disk ?under
    (on-peg ?d - disk ?p - peg)         ; ?d is directly on peg ?p
    (clear-disk ?d - disk)              ; nothing directly on ?d
    (clear-peg ?p - peg)                ; no disk directly on ?p
    (smaller ?x - disk ?y - disk)       ; ?x is strictly smaller than ?y
  )

  ;; Move a top disk from a peg to an empty peg
  (:action move-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to))
            )
  )

  ;; Move a top disk from on-disk (i.e., on another disk) to an empty peg
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
                    (on-disk ?d ?under)
                    (clear-disk ?d)
                    (clear-peg ?to)
                  )
    :effect (and
              (not (on-disk ?d ?under))
              (on-peg ?d ?to)
              (clear-disk ?under)
              (not (clear-peg ?to))
            )
  )

  ;; Move a top disk from a peg onto another disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?target)
                    (smaller ?d ?target)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?target)
              (clear-peg ?from)
              (not (clear-disk ?target))
            )
  )

  ;; Move a top disk from one disk onto another disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?target - disk)
    :precondition (and
                    (on-disk ?d ?under)
                    (clear-disk ?d)
                    (clear-disk ?target)
                    (smaller ?d ?target)
                  )
    :effect (and
              (not (on-disk ?d ?under))
              (on-disk ?d ?target)
              (clear-disk ?under)
              (not (clear-disk ?target))
            )
  )
)