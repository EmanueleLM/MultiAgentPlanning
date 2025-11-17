(define (domain hanoi-3peg-20disk-2agent)
  (:requirements :strips :typing)
  (:types disk peg agent)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (clear ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
  )

  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?p-from - peg ?p-to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p-from)
      (clear ?d)
      (clear-peg ?p-to)
    )
    :effect (and
      (not (on-peg ?d ?p-from))
      (on-peg ?d ?p-to)
      (clear-peg ?p-from)
      (not (clear-peg ?p-to))
    )
  )

  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?p-from - peg ?u - disk)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p-from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
    )
    :effect (and
      (not (on-peg ?d ?p-from))
      (on-disk ?d ?u)
      (clear-peg ?p-from)
      (not (clear ?u))
    )
  )

  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?u - disk ?p-to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-disk ?d ?u)
      (clear ?d)
      (clear-peg ?p-to)
    )
    :effect (and
      (not (on-disk ?d ?u))
      (on-peg ?d ?p-to)
      (clear ?u)
      (not (clear-peg ?p-to))
    )
  )

  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?u-from - disk ?u-to - disk)
    :precondition (and
      (allowed ?a ?d)
      (on-disk ?d ?u-from)
      (clear ?d)
      (clear ?u-to)
      (smaller ?d ?u-to)
    )
    :effect (and
      (not (on-disk ?d ?u-from))
      (on-disk ?d ?u-to)
      (clear ?u-from)
      (not (clear ?u-to))
    )
  )
)