(define (domain Hanoi3Agents15DisksDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (top ?p - peg ?d - disk)            ; ?d is the top disk of peg ?p
    (below ?upper - disk ?lower - disk) ; ?upper is immediately above ?lower on same peg
    (empty ?p - peg)                    ; peg ?p is empty
    (no_below ?d - disk)                ; disk ?d has no disk immediately below it (is top and has no below)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (allowed_agent3 ?d - disk)
    (larger ?d1 - disk ?d2 - disk)      ; ?d1 is larger than ?d2
  )

  ;; Agent 1 actions (for disks A..E)
  (:action agent_1_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (empty ?to)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_1_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )

  (:action agent_1_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (empty ?to)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_1_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )

  ;; Agent 2 actions (for disks F..J)
  (:action agent_2_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (empty ?to)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_2_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )

  (:action agent_2_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (empty ?to)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_2_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )

  ;; Agent 3 actions (for disks K..O)
  (:action agent_3_move_with_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (empty ?to)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_3_move_with_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?b - disk)
    :precondition (and
      (top ?from ?d)
      (below ?d ?b)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?b)
      (not (below ?d ?b))
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )

  (:action agent_3_move_no_below_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (empty ?to)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (no_below ?d)
    )
  )

  (:action agent_3_move_no_below_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (no_below ?d)
      (top ?to ?t)
      (larger ?t ?d)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?t))
      (top ?to ?d)
      (below ?d ?t)
      (not (no_below ?d))
    )
  )
)