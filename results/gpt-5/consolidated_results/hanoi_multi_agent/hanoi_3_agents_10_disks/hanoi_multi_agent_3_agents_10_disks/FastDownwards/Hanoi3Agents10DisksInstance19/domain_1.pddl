(define (domain hanoi-3peg-10disk-3agents)
  (:requirements :strips :typing)
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
    (allowed ?t - step ?a - agent ?d - disk ?from - support ?to - support)
    (curr ?t - step)
    (succ ?t1 - step ?t2 - step)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (curr ?t)
      (succ ?t ?t2)
      (allowed ?t ?a ?d ?from ?to)
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
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (curr ?t)
      (succ ?t ?t2)
      (allowed ?t ?a ?d ?from ?to)
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