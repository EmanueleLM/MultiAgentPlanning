(define (domain hanoi)
  (:requirements :strips :negative-preconditions)

  (:predicates
    ;; disk on support (support = disk or peg)
    (on ?d ?s)

    ;; nothing on top of support (disk or peg)
    (clear ?s)

    ;; size ordering
    (smaller ?d1 ?d2)

    ;; explicit membership predicates (no PDDL typing)
    (disk ?d)
    (peg ?p)

    ;; discrete stage control
    (at-step ?s)
    (next ?s1 ?s2)
  )

  ;; Move a top disk onto an empty peg (peg must be empty/top-clear)
  (:action move-to-peg
    :parameters (?d ?from ?to ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)            ; ?d is top of its stack
      (peg ?to)
      (clear ?to)           ; destination peg is empty (top-clear)
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

  ;; Move a top disk onto another top disk (honour size ordering)
  (:action move-to-disk
    :parameters (?d ?from ?dest ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?dest)
      (clear ?dest)         ; destination disk has nothing on top
      (smaller ?d ?dest)    ; moving disk must be smaller than destination disk
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