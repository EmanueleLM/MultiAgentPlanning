(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; direct support relations: disk directly on another disk
    (on-disk ?d - disk ?s - disk)
    ;; disk directly on peg
    (on-peg ?d - disk ?p - peg)

    ;; base peg mapping for every disk (the peg that contains the disk somewhere in its stack)
    (base-peg ?d - disk ?p - peg)

    ;; top/empty markers
    (clear-disk ?d - disk)   ; disk has nothing on top of it
    (clear-peg ?p - peg)     ; peg has nothing on top (is empty)

    (smaller ?d1 - disk ?d2 - disk)

    (planned-move ?st - step ?d - disk ?src - peg ?dst - peg)
    (next-step ?s1 - step ?s2 - step)
    (enabled ?st - step)
    (done ?st - step)
  )

  ;; Move a top disk that currently sits directly on a peg (?d on ?src peg) to an empty destination peg ?dst (successor exists)
  (:action move-from-peg-to-empty
    :parameters (?st - step ?next - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on-peg ?d ?src)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
    )
    :effect (and
      ;; remove old direct support
      (not (on-peg ?d ?src))
      ;; set new direct support on destination peg (empty)
      (on-peg ?d ?dst)

      ;; update base peg mapping
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)

      ;; the support that lost its top becomes clear: src peg becomes clear
      (clear-peg ?src)

      ;; destination peg is no longer clear
      (not (clear-peg ?dst))

      ;; mark step execution and enable successor
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk that currently sits directly on a peg (?d on ?src peg) to an empty destination peg ?dst (final step, no successor)
  (:action move-from-peg-to-empty-final
    :parameters (?st - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on-peg ?d ?src)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (clear-peg ?src)
      (not (clear-peg ?dst))
      (not (enabled ?st))
      (done ?st)
    )
  )

  ;; Move a top disk that currently sits directly on a peg (?d on ?src peg) onto top disk ?t on ?dst peg (successor exists)
  (:action move-from-peg-to-disk
    :parameters (?st - step ?next - step ?d - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on-peg ?d ?src)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (on-peg ?t ?dst)        ; top disk on dst peg
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?t)

      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)

      ;; src peg becomes clear
      (clear-peg ?src)

      ;; t is no longer clear
      (not (clear-disk ?t))

      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk that currently sits directly on a peg (?d on ?src peg) onto top disk ?t on ?dst peg (final step)
  (:action move-from-peg-to-disk-final
    :parameters (?st - step ?d - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on-peg ?d ?src)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (on-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?t)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (clear-peg ?src)
      (not (clear-disk ?t))
      (not (enabled ?st))
      (done ?st)
    )
  )

  ;; Move a top disk that currently sits directly on another disk (?d on ?support) to an empty destination peg ?dst (successor exists)
  (:action move-from-disk-to-empty
    :parameters (?st - step ?next - step ?d - disk ?support - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
      ;; ensure the support is on the same source peg (its base peg)
      (base-peg ?support ?src)
    )
    :effect (and
      (not (on-disk ?d ?support))
      (on-peg ?d ?dst)

      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)

      ;; now the disk that supported d becomes clear
      (clear-disk ?support)

      ;; destination peg no longer clear
      (not (clear-peg ?dst))

      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk that currently sits directly on another disk (?d on ?support) to an empty destination peg ?dst (final)
  (:action move-from-disk-to-empty-final
    :parameters (?st - step ?d - disk ?support - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
      (base-peg ?support ?src)
    )
    :effect (and
      (not (on-disk ?d ?support))
      (on-peg ?d ?dst)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (clear-disk ?support)
      (not (clear-peg ?dst))
      (not (enabled ?st))
      (done ?st)
    )
  )

  ;; Move a top disk that currently sits directly on another disk (?d on ?support) onto top disk ?t on ?dst peg (successor exists)
  (:action move-from-disk-to-disk
    :parameters (?st - step ?next - step ?d - disk ?support - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (on-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
      (base-peg ?support ?src)
    )
    :effect (and
      (not (on-disk ?d ?support))
      (on-disk ?d ?t)

      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)

      ;; support becomes clear
      (clear-disk ?support)

      ;; t is no longer clear
      (not (clear-disk ?t))

      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk that currently sits directly on another disk (?d on ?support) onto top disk ?t on ?dst peg (final)
  (:action move-from-disk-to-disk-final
    :parameters (?st - step ?d - disk ?support - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (clear-disk ?d)
      (on-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
      (base-peg ?support ?src)
    )
    :effect (and
      (not (on-disk ?d ?support))
      (on-disk ?d ?t)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (clear-disk ?support)
      (not (clear-disk ?t))
      (not (enabled ?st))
      (done ?st)
    )
  )
)