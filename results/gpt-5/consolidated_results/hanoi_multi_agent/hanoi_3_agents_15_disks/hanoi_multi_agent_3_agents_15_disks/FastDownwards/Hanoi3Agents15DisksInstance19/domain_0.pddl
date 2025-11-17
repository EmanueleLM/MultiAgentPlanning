(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-peg-peg
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (on-peg ?d ?p1)
      (clear-disk ?d)
      (clear-peg ?p2)
    )
    :effect (and
      (on-peg ?d ?p2)
      (not (on-peg ?d ?p1))
      (clear-peg ?p1)
      (not (clear-peg ?p2))
    )
  )

  (:action move-peg-disk
    :parameters (?d - disk ?p - peg ?d2 - disk)
    :precondition (and
      (on-peg ?d ?p)
      (clear-disk ?d)
      (clear-disk ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (on-disk ?d ?d2)
      (not (on-peg ?d ?p))
      (clear-peg ?p)
      (not (clear-disk ?d2))
    )
  )

  (:action move-disk-peg
    :parameters (?d - disk ?dfrom - disk ?p - peg)
    :precondition (and
      (on-disk ?d ?dfrom)
      (clear-disk ?d)
      (clear-peg ?p)
    )
    :effect (and
      (on-peg ?d ?p)
      (not (on-disk ?d ?dfrom))
      (clear-disk ?dfrom)
      (not (clear-peg ?p))
    )
  )

  (:action move-disk-disk
    :parameters (?d - disk ?dfrom - disk ?d2 - disk)
    :precondition (and
      (on-disk ?d ?dfrom)
      (clear-disk ?d)
      (clear-disk ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (on-disk ?d ?d2)
      (not (on-disk ?d ?dfrom))
      (clear-disk ?dfrom)
      (not (clear-disk ?d2))
    )
  )
)