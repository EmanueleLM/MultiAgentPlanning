(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; location predicates
    (on-peg ?d - disk ?p - peg)      ;; disk ?d is directly on peg ?p (i.e., disk has the peg as support)
    (on-disk ?d - disk ?under - disk) ;; disk ?d is directly on disk ?under

    ;; top/empty indicators
    (clear-peg ?p - peg)   ;; peg ?p currently has no disk on it (empty)
    (clear-disk ?d - disk) ;; disk ?d currently has no disk on top of it (is top of its stack)

    ;; size ordering relation
    (smaller ?d1 - disk ?d2 - disk) ;; ?d1 is smaller than ?d2

    ;; discrete stage/time progression
    (next ?s1 - stage ?s2 - stage)   ;; successor relation on stages
    (stage-ready ?s - stage)         ;; the planning token marking the current stage
  )

  ;; Move a disk that is the only disk on a peg -> to an empty peg
  (:action move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)    ;; must be the top disk (and thus the only disk on that peg)
      (clear-peg ?to)       ;; destination peg must be empty
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-peg ?disk ?to)) ;; disallow no-op (same peg)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)

      ;; source peg becomes empty, destination peg becomes non-empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; advance stage
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a disk that is the only disk on a peg -> onto the top of another disk
  (:action move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)      ;; disk must be top (only disk on its peg)
      (clear-disk ?target)    ;; target disk must be top to receive
      (smaller ?disk ?target) ;; size ordering
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-disk ?disk ?target)) ;; disallow no-op
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-disk ?disk ?target)

      ;; source peg becomes empty, target disk becomes non-clear (has new top)
      (clear-peg ?from)
      (not (clear-disk ?target))

      ;; advanced stage token
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk that is sitting on another disk -> to an empty peg
  (:action move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on-disk ?disk ?from)
      (clear-disk ?disk)    ;; must be top disk
      (clear-peg ?to)       ;; destination peg empty
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-peg ?disk ?to)) ;; disallow no-op
    )
    :effect (and
      (not (on-disk ?disk ?from))
      (on-peg ?disk ?to)

      ;; the disk that was supporting ?disk becomes top now
      (clear-disk ?from)

      ;; destination peg becomes non-empty
      (not (clear-peg ?to))

      ;; advance stage
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk that is sitting on another disk -> onto another top disk
  (:action move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on-disk ?disk ?from)
      (clear-disk ?disk)      ;; must be top disk
      (clear-disk ?target)    ;; target disk must be top
      (smaller ?disk ?target) ;; size ordering preserved
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on-disk ?disk ?target)) ;; disallow no-op
    )
    :effect (and
      (not (on-disk ?disk ?from))
      (on-disk ?disk ?target)

      ;; the disk that supported ?disk becomes top
      (clear-disk ?from)
      ;; target disk no longer clear
      (not (clear-disk ?target))

      ;; advance stage
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)