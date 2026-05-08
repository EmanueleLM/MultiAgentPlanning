(define (domain hanoi3_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  (:action move-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dest)

      (not (top ?d ?src))
      (top ?d ?dest)

      (not (empty ?dest))
      (empty ?src)

      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?dest - peg ?topdest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?topdest ?dest)
      (smaller ?d ?topdest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?topdest)

      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))

      (not (empty ?dest))
      (empty ?src)

      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-disk-to-empty
    :parameters (?d - disk ?under - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?dest)

      (not (top ?d ?src))
      (top ?d ?dest)
      (top ?under ?src)

      (not (empty ?dest))

      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?src - peg ?dest - peg ?topdest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?topdest ?dest)
      (smaller ?d ?topdest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?topdest)

      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))
      (top ?under ?src)

      (not (current ?s))
      (current ?s2)
    )
  )
)