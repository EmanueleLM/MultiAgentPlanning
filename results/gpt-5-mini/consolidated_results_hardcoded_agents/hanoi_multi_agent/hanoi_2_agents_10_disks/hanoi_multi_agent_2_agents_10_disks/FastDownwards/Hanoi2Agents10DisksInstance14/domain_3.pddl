(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?x - (either peg disk))
    (clear ?x - (either peg disk))
    (larger ?x - (either peg disk) ?y - disk)
    (agent_1_can_move ?d - disk)
    (agent_2_can_move ?d - disk)
  )

  ;; Agent 1: allowed to move disks A..E (enforced in problem via agent_1_can_move facts)
  (:action agent_1_move
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_1_can_move ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2: allowed to move disks F..J (enforced in problem via agent_2_can_move facts)
  (:action agent_2_move
    :parameters (?d - disk ?from - (either peg disk) ?to - (either peg disk))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_2_can_move ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)