(define (domain hanoi-3agent-20disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (can-move ?a - agent ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move_agent_1_to_peg
    :parameters (?a - agent ?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?a - agent ?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )

  (:action move_agent_2_to_peg
    :parameters (?a - agent ?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?a - agent ?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )

  (:action move_agent_3_to_peg
    :parameters (?a - agent ?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  (:action move_agent_3_to_disk
    :parameters (?a - agent ?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )
)