(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ;; disk directly on a peg
    (on-disk ?d - disk ?s - disk)     ;; disk directly on another disk
    (clear-peg ?p - peg)              ;; peg has no disks
    (clear-disk ?d - disk)            ;; no disk on top of ?d
    (smaller ?x - disk ?y - disk)     ;; ?x is smaller than ?y
    (curr ?s - stage)                 ;; current stage/timepoint
    (next ?s1 - stage ?s2 - stage)    ;; stage successor relation
  )

  ;; Move top disk from a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)      ;; ?d must be top
      (clear-peg ?to)      ;; destination peg must be empty (place on peg)
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; Move top disk from a peg onto a top disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)      ;; ?d must be top on its peg
      (clear-disk ?to)     ;; ?to must be top disk on its peg
      (smaller ?d ?to)     ;; cannot place larger on smaller
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; Move top disk from atop a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)      ;; ?d must be top
      (clear-peg ?to)      ;; destination peg must be empty
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; Move top disk from atop a disk onto another top disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)      ;; ?d must be top
      (clear-disk ?to)     ;; destination disk must be top
      (smaller ?d ?to)     ;; cannot place larger on smaller
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (not (curr ?s))
      (curr ?s2)
    )
  )
)