(define (domain hanoi-3agents-20)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (is-peg ?x - object)
    (is-disk ?x - object)
    (larger ?big - disk ?small - disk)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  ;; Agent 1: move to an empty peg
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: move onto another disk (which must be larger)
  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can_move_agent1 ?d)
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
    )
  )

  ;; Agent 2: move to an empty peg
  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move onto another disk (which must be larger)
  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can_move_agent2 ?d)
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
    )
  )

  ;; Agent 3: move to an empty peg
  (:action agent_3_move_to_peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3: move onto another disk (which must be larger)
  (:action agent_3_move_to_disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can_move_agent3 ?d)
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
    )
  )
)