(define (domain hanoi)
  (:requirements :strips :negative-preconditions)

  (:predicates
    ;; relational state
    (on ?d ?s)          ; disk ?d is directly on support ?s (a disk or a peg)
    (clear ?s)          ; nothing on top of support ?s
    (smaller ?d1 ?d2)   ; d1 is strictly smaller than d2

    ;; explicit typing predicates (no :typing required)
    (disk ?d)
    (peg ?p)

    ;; explicit discrete stage control
    (at-step ?s)
    (next ?s1 ?s2)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d ?from ?to ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)            ; ?d is top of its stack
      (peg ?to)
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

  ;; Move a top disk onto another disk (honour size ordering)
  (:action move-to-disk
    :parameters (?d ?from ?to ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
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