(define (domain hanoi-3agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj disk peg)
  (:predicates
    (on ?d - disk ?x - obj)         ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - obj)               ; object ?x has no disk on top of it
    (can_stack ?d - disk ?x - obj) ; disk ?d may be legally placed onto object ?x (peg or larger disk)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  ;; Moves permitted for agent_1
  (:action move_agent_1
    :parameters (?d - disk ?from - obj ?to - obj)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_stack ?d ?to)
      (can_move_agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Moves permitted for agent_2
  (:action move_agent_2
    :parameters (?d - disk ?from - obj ?to - obj)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_stack ?d ?to)
      (can_move_agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Moves permitted for agent_3
  (:action move_agent_3
    :parameters (?d - disk ?from - obj ?to - obj)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_stack ?d ?to)
      (can_move_agent3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)