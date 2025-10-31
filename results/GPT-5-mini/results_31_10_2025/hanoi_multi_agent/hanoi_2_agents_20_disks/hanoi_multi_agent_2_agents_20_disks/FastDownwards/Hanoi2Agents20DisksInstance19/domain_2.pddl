(define (domain cooperative-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (agent1_owned ?d - disk)
    (agent2_owned ?d - disk)
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg)
    (step ?s - step)
    (next ?s - step ?s2 - step)
  )

  (:action agent_1_move
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on-peg ?d ?from)
      (agent1_owned ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (step ?s))
      (step ?s2)
    )
  )

  (:action agent_2_move
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on-peg ?d ?from)
      (agent2_owned ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (step ?s))
      (step ?s2)
    )
  )
)