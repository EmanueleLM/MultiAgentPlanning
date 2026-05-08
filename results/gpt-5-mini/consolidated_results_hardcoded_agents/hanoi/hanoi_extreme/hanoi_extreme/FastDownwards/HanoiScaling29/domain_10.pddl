(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; ?d directly on peg ?p (support is a peg)
    (on-disk ?d - disk ?s - disk)      ; ?d directly on top of disk ?s (support is a disk)
    (base-peg ?d - disk ?p - peg)      ; ?d is located on peg ?p (the peg containing that disk)
    (clear-disk ?d - disk)             ; no disk on top of ?d
    (clear-peg ?p - peg)               ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2
    (next-step ?s1 - step ?s2 - step)  ; ordering of steps
    (enabled ?s - step)                ; this step may be executed now
    (done ?s - step)                   ; this step has been executed
  )

  (:action move-peg-to-empty
    :parameters (?st - step ?next - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
      (next-step ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (not (clear-peg ?dst))
      (clear-peg ?src)
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  (:action move-peg-to-empty-final
    :parameters (?st - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (not (clear-peg ?dst))
      (clear-peg ?src)
      (not (enabled ?st))
      (done ?st)
    )
  )

  (:action move-peg-to-disk
    :parameters (?st - step ?next - step ?d - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (base-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
      (next-step ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?t)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (not (clear-disk ?t))
      (not (clear-peg ?dst))
      (clear-peg ?src)
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  (:action move-peg-to-disk-final
    :parameters (?st - step ?d - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (base-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?t)
      (not (base-peg ?d ?src))
      (base-peg ?d ?dst)
      (not (clear-disk ?t))
      (not (clear-peg ?dst))
      (clear-peg ?src)
      (not (enabled ?st))
      (done ?st)
    )
  )

  (:action move-disk-to-empty
    :parameters (?st - step ?next - step ?d - disk ?support - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (base-peg ?support ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
      (next-step ?st ?next)
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
      (enabled ?next)
    )
  )

  (:action move-disk-to-empty-final
    :parameters (?st - step ?d - disk ?support - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (base-peg ?support ?src)
      (clear-disk ?d)
      (clear-peg ?dst)
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

  (:action move-disk-to-disk
    :parameters (?st - step ?next - step ?d - disk ?support - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (base-peg ?support ?src)
      (clear-disk ?d)
      (base-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
      (next-step ?st ?next)
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
      (enabled ?next)
    )
  )

  (:action move-disk-to-disk-final
    :parameters (?st - step ?d - disk ?support - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (enabled ?st)
      (on-disk ?d ?support)
      (base-peg ?d ?src)
      (base-peg ?support ?src)
      (clear-disk ?d)
      (base-peg ?t ?dst)
      (clear-disk ?t)
      (smaller ?d ?t)
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