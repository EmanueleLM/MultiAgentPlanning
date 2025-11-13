(define (domain hanoi-multiagent-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
    (ok-support ?d - disk ?s - support)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?s - support ?t - support)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (ok-support ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
    )
  )
)