(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?s - (either disk peg))
    (clear ?o - (either disk peg))
    (smaller ?x - disk ?y - disk)
    (agent1-disk ?d - disk)
    (agent2-disk ?d - disk)
    (agent3-disk ?d - disk)
  )

  ;; ----- agent 1 actions -----
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; ----- agent 2 actions -----
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; ----- agent 3 actions -----
  (:action move_agent3_to_peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent3_to_disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)