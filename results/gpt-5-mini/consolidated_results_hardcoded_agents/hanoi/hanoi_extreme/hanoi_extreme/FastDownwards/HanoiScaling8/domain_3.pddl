(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)
    (top-on ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action move-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top-on ?d ?src)
      (empty ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      (not (empty ?dst))
      (empty ?src)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top-on ?d ?src)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      (on-disk ?d ?td)
      (top-on ?d ?dst)
      (not (top-on ?td ?dst))

      (empty ?src)
      (not (empty ?dst))
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top-on ?d ?src)
      (empty ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      (top-on ?below ?src)

      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      (not (empty ?dst))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top-on ?d ?src)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      (top-on ?below ?src)

      (on-disk ?d ?td)
      (top-on ?d ?dst)
      (not (top-on ?td ?dst))

      (not (empty ?dst))
    )
  )
)