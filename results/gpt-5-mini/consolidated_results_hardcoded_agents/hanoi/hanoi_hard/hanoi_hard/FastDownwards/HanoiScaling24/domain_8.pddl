(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?s - (either disk peg))   ;; disk on a support (disk or peg)
    (clear ?s - (either disk peg))          ;; support has nothing on top
    (smaller ?d1 - disk ?d2 - disk)         ;; size ordering: ?d1 smaller than ?d2
    (at-step ?t - step)                     ;; current stage marker
    (next ?t1 - step ?t2 - step)            ;; strict successor relation for stages
  )

  ;; Move a top disk onto an empty peg (peg must be empty/clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?dest - disk ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dest)
      (smaller ?d ?dest)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dest)
      (not (clear ?dest))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )
)