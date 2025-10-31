(define (domain hanoi_2agents_20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (clear-peg ?p - peg)
    (smaller ?a - disk ?b - disk)
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
  )

  (:action agent_1_move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
    )
  )

  (:action agent_1_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear-peg ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear-peg ?to))
    )
  )

  (:action agent_1_move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (clear ?d)
      (not (clear ?to))
    )
  )

  (:action agent_1_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear-peg ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (clear ?d)
      (not (clear-peg ?to))
    )
  )

  (:action agent_2_move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
    )
  )

  (:action agent_2_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear-peg ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear-peg ?to))
    )
  )

  (:action agent_2_move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (clear ?d)
      (not (clear ?to))
    )
  )

  (:action agent_2_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear-peg ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (clear ?d)
      (not (clear-peg ?to))
    )
  )
)