(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)                ; disk d is directly on support s (disk or peg)
    (onpeg ?d - disk ?p - peg)                ; disk d's base peg is p
    (clear ?s - support)                      ; support s has nothing on top (peg empty or disk has nothing on it)
    (smaller ?d1 - disk ?d2 - disk)           ; d1 is smaller than d2
    (planned-move ?st - step ?d - disk ?src - peg ?dst - peg) ; mapping step -> concrete move
    (next-step ?s1 - step ?s2 - step)         ; ordering of steps
    (enabled ?st - step)                      ; step is enabled to execute (its turn)
    (done ?st - step)                         ; step has been executed
  )

  ;; Move a top disk ?d from ?src peg to an empty destination peg ?dst, with successor step
  (:action move-to-empty
    :parameters (?st - step ?next - step ?d - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?dst)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?dst))
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk ?d from ?src peg to an empty destination peg ?dst, final step (no successor)
  (:action move-to-empty-final
    :parameters (?st - step ?d - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?dst)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?dst))
      (not (enabled ?st))
      (done ?st)
    )
  )

  ;; Move a top disk ?d from ?src peg onto top disk ?t that currently sits (somewhere) on ?dst peg, with successor step
  (:action move-to-disk
    :parameters (?st - step ?next - step ?d - disk ?t - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (onpeg ?t ?dst)      ; top disk t is on peg ?dst (somewhere on that peg)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?t)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?t))
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; Move a top disk ?d from ?src peg onto top disk ?t on ?dst peg, final step (no successor)
  (:action move-to-disk-final
    :parameters (?st - step ?d - disk ?t - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (onpeg ?t ?dst)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?t)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?t))
      (not (enabled ?st))
      (done ?st)
    )
  )
)