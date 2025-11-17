(define (domain hanoi-3peg-typed)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-from-disk-to-peg
    :parameters (?d - disk ?u - disk ?p - peg)
    :precondition (and
      (clear-disk ?d)
      (on-disk ?d ?u)
      (clear-peg ?p))
    :effect (and
      (on-peg ?d ?p)
      (not (on-disk ?d ?u))
      (clear-disk ?u)
      (not (clear-peg ?p)))
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?v - disk)
    :precondition (and
      (clear-disk ?d)
      (on-disk ?d ?u)
      (clear-disk ?v)
      (smaller ?d ?v))
    :effect (and
      (on-disk ?d ?v)
      (not (on-disk ?d ?u))
      (clear-disk ?u)
      (not (clear-disk ?v)))
  )

  (:action move-from-peg-to-peg
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (clear-disk ?d)
      (on-peg ?d ?p1)
      (clear-peg ?p2))
    :effect (and
      (on-peg ?d ?p2)
      (not (on-peg ?d ?p1))
      (clear-peg ?p1)
      (not (clear-peg ?p2)))
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?p - peg ?v - disk)
    :precondition (and
      (clear-disk ?d)
      (on-peg ?d ?p)
      (clear-disk ?v)
      (smaller ?d ?v))
    :effect (and
      (on-disk ?d ?v)
      (not (on-peg ?d ?p))
      (clear-peg ?p)
      (not (clear-disk ?v)))
  )
)