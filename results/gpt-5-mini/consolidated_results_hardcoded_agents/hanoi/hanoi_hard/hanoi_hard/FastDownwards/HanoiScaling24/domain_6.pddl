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

  ;; Move a top disk onto an empty peg (destination must be a peg and empty)
  (:action move-to-peg
    :parameters (?d ?from ?to ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
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

  ;; Move a top disk onto another top disk (honour size ordering)
  (:action move-to-disk
    :parameters (?d ?from ?dest ?cur ?next)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?dest)
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