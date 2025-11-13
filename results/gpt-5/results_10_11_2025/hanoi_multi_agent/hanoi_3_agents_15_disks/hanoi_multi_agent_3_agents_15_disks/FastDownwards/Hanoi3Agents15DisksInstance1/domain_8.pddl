(define (domain hanoi-3agents-15disks-staged)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
    agent stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
    (next ?t1 - stage ?t2 - stage)
    (at ?t - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (at ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (at ?t)
      (next ?t ?t2)
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
      (not (at ?t))
      (at ?t2)
    )
  )
)