(define (domain hanoi-3agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (canmove ?a - agent ?d - disk)
    (atstage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg ?s - stage ?t - stage)
    :precondition (and
      (atstage ?s)
      (succ ?s ?t)
      (canmove ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (not (on ?d ?p))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?u - disk ?s - stage ?t - stage)
    :precondition (and
      (atstage ?s)
      (succ ?s ?t)
      (canmove ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
      (not (on ?d ?u))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
      (not (atstage ?s))
      (atstage ?t)
    )
  )
)