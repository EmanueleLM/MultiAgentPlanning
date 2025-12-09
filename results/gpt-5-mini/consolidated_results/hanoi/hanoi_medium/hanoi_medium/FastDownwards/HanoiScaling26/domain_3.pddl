(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place stage
    peg disk - place
  )

  (:predicates
    ;; disk ?d is directly on place ?p (where ?p can be a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing immediately on top of it
    (clear ?p - place)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal successor relation for contiguous stages
    (next ?s1 - stage ?s2 - stage)
    ;; stage readiness (exactly one stage is ready at a time; actions move readiness forward)
    (stage-ready ?s - stage)
  )

  ;; Move a clear disk from a place onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?disk - disk ?from - place ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk is currently on 'from'
      (clear ?disk)           ;; disk has nothing on top
      (clear ?to)             ;; destination peg is empty (top-of-peg is clear)
      (stage-ready ?cur)      ;; current stage is active
      (next ?cur ?next)       ;; enforces contiguous progression of stages
      (not (on ?disk ?to))    ;; disallow noop moving to same place (covers ?from == ?to)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))      ;; peg now has something on top
      (clear ?from)          ;; previous place becomes clear
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a clear disk from a place onto another clear disk (must be larger).
  (:action mover-move-to-disk
    :parameters (?disk - disk ?from - place ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)         ;; disk is currently on 'from'
      (clear ?disk)            ;; disk has nothing on top
      (clear ?target)          ;; target disk has nothing on top
      (smaller ?disk ?target)  ;; size constraint: moved disk must be smaller than target disk
      (stage-ready ?cur)       ;; current stage is active
      (next ?cur ?next)        ;; enforces contiguous progression of stages
      (not (on ?disk ?target)) ;; disallow noop moving to same place (covers ?from == ?target)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?target)
      (not (clear ?target))   ;; target disk no longer clear
      (clear ?from)           ;; previous place becomes clear
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)