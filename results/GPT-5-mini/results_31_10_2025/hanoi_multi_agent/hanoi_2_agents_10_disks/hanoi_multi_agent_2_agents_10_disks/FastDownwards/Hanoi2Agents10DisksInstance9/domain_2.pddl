(define (domain hanoi-two-agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (agent1 ?d - disk)
    (agent2 ?d - disk)
    (larger ?big - disk ?small - disk)
  )

  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - object ?peg - peg)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (clear ?d)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - object ?peg - peg)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (clear ?d)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)