(define (domain hanoi_agents)
  (:requirements :strips :typing)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can_move_agent_1 ?d - disk)
    (can_move_agent_2 ?d - disk)
    (can_move_agent_3 ?d - disk)
  )

  ;; Agent 1 actions: move to an empty peg
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (can_move_agent_1 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 1 actions: move onto another disk (must be larger)
  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (can_move_agent_1 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 2 actions
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (can_move_agent_2 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (can_move_agent_2 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 3 actions
  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (can_move_agent_3 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move_agent_3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (can_move_agent_3 ?d))
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
    )
  )
)