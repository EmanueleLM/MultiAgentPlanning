(define (domain multiagent-hanoi-3agents)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?d ?s)
    (clear ?x)
    (allowed1 ?d)
    (allowed2 ?d)
    (allowed3 ?d)
    (canplace ?d ?s)
  )

  (:action move-agent_1
    :parameters (?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed1 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-agent_2
    :parameters (?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed2 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-agent_3
    :parameters (?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed3 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)