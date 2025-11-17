(define (domain hanoi3agents-20-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent place stage
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (at ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s1))
      (at ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s1))
      (at ?s2)
    )
  )
)