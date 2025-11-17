(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (on ?d - obj ?p - obj)               ; disk or peg relation (disk on disk/peg)
    (clear ?o - obj)                    ; nothing on top of this object (peg or disk)
    (smaller ?x - obj ?y - obj)         ; x is strictly smaller than y
    (agent1-disk ?d - obj)
    (agent2-disk ?d - obj)
    (agent3-disk ?d - obj)
    (disk ?d - obj)
    (peg ?p - obj)
  )

  ; ----- agent 1 actions -----
  (:action move_agent1_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent1-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
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
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent1-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
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

  ; ----- agent 2 actions -----
  (:action move_agent2_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent2-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
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
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent2-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
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

  ; ----- agent 3 actions -----
  (:action move_agent3_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent3-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
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
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent3-disk ?d)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
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