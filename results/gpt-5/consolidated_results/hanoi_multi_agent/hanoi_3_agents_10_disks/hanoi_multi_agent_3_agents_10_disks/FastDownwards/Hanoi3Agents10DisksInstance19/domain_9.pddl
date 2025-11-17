(define (domain hanoi-3peg-10disk-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    step
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (sched-to-peg ?t - step ?a - agent ?d - disk ?from - support ?to - peg)
    (sched-to-disk ?t - step ?a - agent ?d - disk ?from - support ?to - disk)
    (curr ?t - step)
    (next ?t1 - step ?t2 - step)
  )

  (:action move-to-peg
    :parameters (?t - step ?t2 - step ?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (curr ?t)
      (next ?t ?t2)
      (sched-to-peg ?t ?a ?d ?from ?to)
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?t - step ?t2 - step ?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (curr ?t)
      (next ?t ?t2)
      (sched-to-disk ?t ?a ?d ?from ?to)
      (can-move ?a ?d)
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
      (not (curr ?t))
      (curr ?t2)
    )
  )
)