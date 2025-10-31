(define (domain hanoi-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types agent place disk - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (can-move ?a - agent ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-agent1-to-place
    :parameters (?d - disk ?from - object ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-place
    :parameters (?d - disk ?from - object ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)