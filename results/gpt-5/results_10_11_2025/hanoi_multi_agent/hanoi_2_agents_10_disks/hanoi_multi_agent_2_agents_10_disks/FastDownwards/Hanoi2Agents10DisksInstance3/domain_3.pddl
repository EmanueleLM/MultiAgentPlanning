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
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?cur - stage ?nxt - stage)
    :precondition (and
      (permitted ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (stage ?cur)
      (next ?cur ?nxt)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
      (not (stage ?cur))
      (stage ?nxt)
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
      (stage ?cur)
      (next ?cur ?nxt)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
      (not (stage ?cur))
      (stage ?nxt)
    )
  )
)