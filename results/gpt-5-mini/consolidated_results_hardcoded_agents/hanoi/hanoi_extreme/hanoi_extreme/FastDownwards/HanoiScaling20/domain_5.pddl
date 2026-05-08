(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; stacking relations
    (on-peg ?d - disk ?p - peg)      ;; disk directly on peg (bottom-most on that peg)
    (on-disk ?d - disk ?s - disk)    ;; disk directly on another disk

    ;; top/clear predicates
    (clear-peg ?p - peg)             ;; peg has no disk directly on it (empty)
    (clear-disk ?d - disk)           ;; disk has no disk directly on top (is top of its stack)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)  ;; ?d1 is smaller than ?d2

    ;; step sequencing and verification
    (ready ?st - step)
    (step-unmoved ?st - step)
    (verified-step ?st - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a disk that is directly on a peg to an empty peg
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
      ;; update stacking
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; pegs become empty/non-empty accordingly
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; step sequencing bookkeeping (enforce one move per step)
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (destination must be larger)
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
      ;; update stacking
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; peg becomes empty
      (clear-peg ?from)

      ;; destination disk no longer clear (has disk on top)
      (not (clear-disk ?to))

      ;; step sequencing bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move a disk that is directly on another disk onto an empty peg
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
      ;; update stacking
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that supported ?d is now clear (no disk on it)
      (clear-disk ?from)

      ;; destination peg becomes non-empty
      (not (clear-peg ?to))

      ;; step sequencing bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk (destination must be larger)
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
      ;; update stacking
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that supported ?d is now clear
      (clear-disk ?from)

      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; step sequencing bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )
)