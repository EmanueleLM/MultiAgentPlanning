(define (domain hanoi2agents)
  (:requirements :strips :typing)
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
    (permitted ?a - agent ?d - disk)
    (curstage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?cur - stage ?nxt - stage)
    :precondition (and
      (permitted ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (curstage ?cur)
      (next ?cur ?nxt)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
      (not (curstage ?cur))
      (curstage ?nxt)
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?cur - stage ?nxt - stage)
    :precondition (and
      (permitted ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (curstage ?cur)
      (next ?cur ?nxt)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
      (not (curstage ?cur))
      (curstage ?nxt)
    )
  )
)