(define (domain hanoi-3agent-10disks-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
    agent stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?ag - agent ?d - disk)
    (curr ?st - stage)
    (next ?st - stage ?su - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?p - peg ?s - stage ?t - stage)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (curr ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (curr ?s))
      (curr ?t)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?u - disk ?s - stage ?t - stage)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
      (curr ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
      (not (curr ?s))
      (curr ?t)
    )
  )
)