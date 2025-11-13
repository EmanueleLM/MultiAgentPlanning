(define (domain hanoi3agents10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
    stage
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (allowed ?a ?d)
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (allowed ?a ?d)
      (current ?s1)
      (next ?s1 ?s2)
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
    )
  )
  (:action advance-stage
    :parameters (?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)
    )
  )
)