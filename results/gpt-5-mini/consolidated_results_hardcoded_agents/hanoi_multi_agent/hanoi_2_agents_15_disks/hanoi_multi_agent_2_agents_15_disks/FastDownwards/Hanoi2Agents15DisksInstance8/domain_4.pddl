(define (domain hanoi_multi_agent)
  (:requirements :strips)
  (:predicates
    (on ?d ?x)
    (clear ?x)
    (allowed_agent1 ?d)
    (allowed_agent2 ?d)
    (smaller ?d1 ?d2)
  )

  (:action move_agent_1_peg_to_peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (allowed_agent1 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (allowed_agent1 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (allowed_agent1 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (allowed_agent1 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_2_peg_to_peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (allowed_agent2 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (allowed_agent2 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (allowed_agent2 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (allowed_agent2 ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)