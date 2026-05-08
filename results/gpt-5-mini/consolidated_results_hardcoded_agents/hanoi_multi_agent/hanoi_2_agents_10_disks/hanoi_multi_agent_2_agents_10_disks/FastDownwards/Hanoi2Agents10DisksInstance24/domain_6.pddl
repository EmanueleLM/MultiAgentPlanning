(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:constants agent_1 agent_2 orchestrator - agent)

  (:predicates
    (peg ?p - peg)
    (disk ?d - disk)
    (on ?d - disk ?p - peg)
    (top ?p - peg ?d - disk)
    (above ?upper - disk ?lower - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?ag - agent ?d - disk)
    (empty ?p - peg)
  )

  ;; Moves by agent_1
  (:action agent_1_move_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (empty ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (empty ?to))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_to_empty_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?from ?d)
      (empty ?to)
      (can-move agent_1 ?d)
      (not (above ?d ?b))
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_onto_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?e - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_onto_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?e - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Moves by agent_2
  (:action agent_2_move_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (empty ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (empty ?to))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_to_empty_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?from ?d)
      (empty ?to)
      (can-move agent_2 ?d)
      (not (above ?d ?b))
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_onto_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?e - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_onto_no_below
    :parameters (?d - disk ?from - peg ?to - peg ?e - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (not (above ?d ?b))
      (top ?to ?e)
      (smaller ?d ?e)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?to ?e))
      (above ?d ?e)
      (top ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )
)