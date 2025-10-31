(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    peg - object
    disk - object
    disk_s disk_l - disk
  )

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (smaller ?a - object ?b - object)
  )

  (:action move-agent_1
    :parameters (?d - disk_s ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent_2
    :parameters (?d - disk_l ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)