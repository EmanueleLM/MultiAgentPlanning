(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (top ?p - peg ?d - disk)
    (peg-empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (peg-empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  (:action move_from_disk_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (peg-empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?under))
      (not (top ?from ?d))
      (top ?from ?under)

      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )

  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?under))
      (not (top ?from ?d))
      (top ?from ?under)

      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )
)