(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)                 ; disk ?d is located on peg ?p
    (top ?p - peg ?d - disk)               ; ?d is the top disk on peg ?p
    (bottom ?p - peg ?d - disk)            ; ?d is the bottom disk on peg ?p (single disk case or bottom)
    (above ?d1 - disk ?d2 - disk)          ; ?d1 is immediately above ?d2 on same peg
    (empty ?p - peg)                       ; peg has no disks
    (agent1_can_move ?d - disk)
    (agent2_can_move ?d - disk)
    (agent3_can_move ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)        ; ?d1 is strictly smaller than ?d2
  )

  ;; AGENT 1 actions (moves disks A,B,C,D)
  (:action agent_1_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (empty ?to)
      (agent1_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (empty ?to)
      (agent1_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent1_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_1_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent1_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; AGENT 2 actions (moves disks E,F,G)
  (:action agent_2_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (empty ?to)
      (agent2_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (empty ?to)
      (agent2_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent2_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_2_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent2_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; AGENT 3 actions (moves disks H,I,J)
  (:action agent_3_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (empty ?to)
      (agent3_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_3_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (empty ?to)
      (agent3_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (bottom ?to ?d)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_3_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (above ?d ?below)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent3_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (above ?d ?below))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  (:action agent_3_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (bottom ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
      (agent3_can_move ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )
)