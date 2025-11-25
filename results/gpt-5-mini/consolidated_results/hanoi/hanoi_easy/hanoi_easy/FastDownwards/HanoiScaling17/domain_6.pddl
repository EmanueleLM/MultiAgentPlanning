(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (disk-on-peg ?d - disk ?p - peg)
    (top-of-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (no-under ?d - disk)
    (peg-empty ?p - peg)
    (smaller-than ?d1 - disk ?d2 - disk)
    (next ?s - stage ?snext - stage)
    (current-stage ?s - stage)
    (diff ?p1 - peg ?p2 - peg)
  )

  (:action move-to-empty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (disk-on-peg ?under ?from)
      (peg-empty ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      (not (on-disk ?d ?under))
      (no-under ?d)

      (not (peg-empty ?to))

      (top-of-peg ?under ?from)

      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action move-to-empty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (peg-empty ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      (not (peg-empty ?to))
      (peg-empty ?from)

      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action move-to-nonempty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (disk-on-peg ?under ?from)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      (not (on-disk ?d ?under))
      (on-disk ?d ?topp)

      (not (no-under ?d))

      (top-of-peg ?under ?from)

      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action move-to-nonempty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      (on-disk ?d ?topp)

      (peg-empty ?from)

      (not (no-under ?d))

      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)