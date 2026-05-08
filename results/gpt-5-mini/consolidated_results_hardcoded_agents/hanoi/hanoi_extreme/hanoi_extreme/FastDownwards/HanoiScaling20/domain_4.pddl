(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; stacking relations
    (on-peg ?d - disk ?p - peg)      ;; disk directly on peg
    (on-disk ?d - disk ?s - disk)    ;; disk directly on another disk

    ;; top/clear predicates
    (clear-peg ?p - peg)             ;; no disk directly on this peg
    (clear-disk ?d - disk)           ;; no disk directly on this disk (i.e., disk is top)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)  ;; ?d1 is smaller than ?d2

    ;; step sequencing and verification
    (ready ?st - step)
    (step-unmoved ?st - step)
    (verified-step ?st - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move from peg to peg
  (:action move-peg-to-peg
    :parameters (?st - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move from peg to disk (must be smaller than destination disk)
  (:action move-peg-to-disk
    :parameters (?st - step ?d - disk ?from - peg ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move from disk to peg
  (:action move-disk-to-peg
    :parameters (?st - step ?d - disk ?from - disk ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move from disk to disk (must be smaller than destination disk)
  (:action move-disk-to-disk
    :parameters (?st - step ?d - disk ?from - disk ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )
)