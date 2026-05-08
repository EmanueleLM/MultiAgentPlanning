(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?under - disk)

    ;; top-of-peg is empty
    (clear-peg ?p - peg)
    ;; disk has nothing on top
    (clear-disk ?d - disk)

    ;; size ordering predicate (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; temporal successor relation for contiguous stages
    (next ?s1 - stage ?s2 - stage)
    ;; exactly one stage is active (stage consumption model)
    (stage-ready ?s - stage)
  )

  ;; Move a top disk from a peg to another peg (both pegs).
  (:action move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on-peg ?disk ?from)    ;; disk is directly on the source peg
      (clear-disk ?disk)      ;; disk is top of its stack
      (clear-peg ?to)         ;; destination peg is empty on top
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-peg ?disk ?to)) ;; prevent no-op
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)

      ;; destination peg no longer empty; source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; consume and enable stages (enforces contiguous progression)
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk from a peg onto a disk (peg -> disk).
  (:action move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-disk ?target)
      (smaller ?disk ?target)
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-disk ?disk ?target))
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-disk ?disk ?target)

      ;; target disk no longer clear; source peg becomes clear
      (not (clear-disk ?target))
      (clear-peg ?from)

      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk from a disk onto a peg (disk -> peg).
  (:action move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on-disk ?disk ?from)
      (clear-disk ?disk)
      (clear-peg ?to)
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-peg ?disk ?to))
    )
    :effect (and
      (not (on-disk ?disk ?from))
      (on-peg ?disk ?to)

      ;; disk under becomes clear; destination peg no longer clear
      (clear-disk ?from)
      (not (clear-peg ?to))

      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk from a disk onto another disk (disk -> disk).
  (:action move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on-disk ?disk ?from)
      (clear-disk ?disk)
      (clear-disk ?target)
      (smaller ?disk ?target)
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-disk ?disk ?target))
    )
    :effect (and
      (not (on-disk ?disk ?from))
      (on-disk ?disk ?target)

      ;; disk under becomes clear; target no longer clear
      (clear-disk ?from)
      (not (clear-disk ?target))

      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)