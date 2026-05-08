(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action move-from-peg-to-empty
    :parameters (?d - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (empty ?p_to))
      (empty ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )

  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?p_to)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (top ?below ?p_from)

      (not (empty ?p_to))

      (not (current ?s))
      (current ?ns)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-disk ?d ?t)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (top ?t ?p_to))

      (empty ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (top ?t ?p_to))

      (top ?below ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )
)