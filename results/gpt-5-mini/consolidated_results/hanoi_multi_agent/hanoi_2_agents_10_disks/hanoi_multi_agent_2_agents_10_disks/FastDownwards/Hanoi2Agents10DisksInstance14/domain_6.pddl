(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)         ; ?d is directly on ?x (x is peg or disk below ?d)
    (clear ?x - object)               ; nothing is on ?x (peg or disk)
    (larger ?x - object ?y - disk)    ; ?x (peg or disk) is larger than disk ?y
    (agent_1_can_move ?d - disk)
    (agent_2_can_move ?d - disk)
  )

  (:action agent_1_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_1_can_move ?d)
      (not (on ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent_2_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_2_can_move ?d)
      (not (on ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)