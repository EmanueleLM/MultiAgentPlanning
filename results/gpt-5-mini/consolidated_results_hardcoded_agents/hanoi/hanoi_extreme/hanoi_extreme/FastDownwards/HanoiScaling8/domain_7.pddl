(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)
    (clear-disk ?d - disk)
    (empty-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (empty-peg ?dst)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      (empty-peg ?src)
      (not (empty-peg ?dst))
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (empty-peg ?dst)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?below))
      (on-peg ?d ?dst)
      (clear-disk ?below)
      (not (empty-peg ?dst))
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?src - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?src)
      (clear-disk ?d)
      (clear-disk ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?src))
      (on-disk ?d ?td)
      (empty-peg ?src)
      (not (clear-disk ?td))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?below))
      (on-disk ?d ?td)
      (clear-disk ?below)
      (not (clear-disk ?td))
    )
  )
)