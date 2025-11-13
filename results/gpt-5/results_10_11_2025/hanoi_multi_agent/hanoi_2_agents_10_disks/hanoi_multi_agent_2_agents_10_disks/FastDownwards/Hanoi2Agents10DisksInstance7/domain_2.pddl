(define (domain hanoi-3peg-2agents-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    step
    place
    peg disk - place
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (at-step ?s - step)
    (succ ?s1 - step ?s2 - step)
    (scheduled-peg ?s - step ?a - agent ?d - disk ?from - place ?to - peg)
    (scheduled-disk ?s - step ?a - agent ?d - disk ?from - place ?to - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (scheduled-peg ?s ?a ?d ?from ?to)
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (scheduled-disk ?s ?a ?d ?from ?to)
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)