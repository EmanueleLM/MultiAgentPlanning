(define (domain multiagent-hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?s - (either peg disk))
    (clear ?s - (either peg disk))
    (allowed1 ?d - disk)
    (allowed2 ?d - disk)
    (allowed3 ?d - disk)
    (canplace ?d - disk ?s - (either peg disk))
  )

  (:action move-agent_1
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
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
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
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
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
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