(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; Disk placement relations
    (on-disk ?d - disk ?under - disk)   ;; ?d is directly on top of disk ?under
    (on-peg ?d - disk ?p - peg)         ;; ?d is directly on peg ?p

    ;; Whether a place (disk or peg) is clear (no disk immediately on it)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    ;; Size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
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
              (not (clear-peg ?to))
              (clear-peg ?from)
            )
  )

  ;; Move a top disk from a disk (i.e., from on-disk) to an empty peg
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
              (not (clear-peg ?to))
              (clear-disk ?under)
            )
  )

  ;; Move a top disk from a peg onto another disk (must be larger)
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
              (not (clear-disk ?target))
              (clear-peg ?from)
            )
  )

  ;; Move a top disk from one disk onto another disk (must be larger)
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
              (not (clear-disk ?target))
              (clear-disk ?under)
            )
  )
)