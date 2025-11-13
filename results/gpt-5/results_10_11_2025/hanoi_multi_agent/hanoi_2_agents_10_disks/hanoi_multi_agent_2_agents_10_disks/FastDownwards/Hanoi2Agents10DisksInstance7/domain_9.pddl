(define (domain hanoi-3peg-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg disk - place
    stage
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )
)