(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types support step disk peg - support)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (peg or disk)
    (clear ?s - support)               ; nothing on top of support ?s
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2
    (at-step ?s - step)                ; current plan step marker
    (next ?s1 - step ?s2 - step)       ; successor relation for steps
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)            ; disk ?d is top of its stack
      (clear ?to)           ; destination peg has nothing on top
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

  ;; Move a top disk onto another disk (respect size ordering)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)      ; moving disk must be smaller than destination disk
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
)