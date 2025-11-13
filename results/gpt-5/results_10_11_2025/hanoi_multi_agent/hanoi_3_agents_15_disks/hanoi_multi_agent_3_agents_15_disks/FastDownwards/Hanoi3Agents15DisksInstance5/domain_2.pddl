(define (domain hanoi_3agents_15)
  (:requirements :strips :typing)
  (:types
    support - object
    disk peg - support
    agent - object
  )
  (:predicates
    (on ?x - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (owned-by ?x - disk ?a - agent)
  )

  (:action move_to_peg_agent_1
    :parameters (?x - disk ?from - support ?p - peg)
    :precondition (and
      (owned-by ?x agent_1)
      (on ?x ?from)
      (clear ?x)
      (clear ?p))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?p)
      (clear ?from)
      (not (clear ?p))
      (clear ?x))
  )

  (:action move_to_disk_agent_1
    :parameters (?x - disk ?from - support ?y - disk)
    :precondition (and
      (owned-by ?x agent_1)
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (clear ?from)
      (not (clear ?y))
      (clear ?x))
  )

  (:action move_to_peg_agent_2
    :parameters (?x - disk ?from - support ?p - peg)
    :precondition (and
      (owned-by ?x agent_2)
      (on ?x ?from)
      (clear ?x)
      (clear ?p))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?p)
      (clear ?from)
      (not (clear ?p))
      (clear ?x))
  )

  (:action move_to_disk_agent_2
    :parameters (?x - disk ?from - support ?y - disk)
    :precondition (and
      (owned-by ?x agent_2)
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (clear ?from)
      (not (clear ?y))
      (clear ?x))
  )

  (:action move_to_peg_agent_3
    :parameters (?x - disk ?from - support ?p - peg)
    :precondition (and
      (owned-by ?x agent_3)
      (on ?x ?from)
      (clear ?x)
      (clear ?p))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?p)
      (clear ?from)
      (not (clear ?p))
      (clear ?x))
  )

  (:action move_to_disk_agent_3
    :parameters (?x - disk ?from - support ?y - disk)
    :precondition (and
      (owned-by ?x agent_3)
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (clear ?from)
      (not (clear ?y))
      (clear ?x))
  )
)