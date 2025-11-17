(define (domain hanoi-3peg-10disk)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?p - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - support ?u - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
    )
  )
)