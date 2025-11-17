(define (domain hanoi-3agent-10disks)
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
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?p - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (at ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (at ?t1))
      (at ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?u - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
      (at ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
      (not (at ?t1))
      (at ?t2)
    )
  )
)