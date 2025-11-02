(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ; relation: disk is on object (disk or peg)
    (on ?d - obj ?p - obj)
    ; object (disk or peg) has nothing on top
    (clear ?o - obj)
    ; size ordering: smaller X Y means X is strictly smaller than Y
    (smaller ?x - obj ?y - obj)
    ; agent membership predicates (which disks each agent may move)
    (agent1-disk ?d - obj)
    (agent2-disk ?d - obj)
    (agent3-disk ?d - obj)
    ; classify objects as disks or pegs for action preconditions
    (disk ?d - obj)
    (peg ?p - obj)
  )

  ; ---- agent 1 actions ----
  (:action move_agent1_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent1-disk ?d)
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

  ; ---- agent 2 actions ----
  (:action move_agent2_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent2-disk ?d)
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

  ; ---- agent 3 actions ----
  (:action move_agent3_to_peg
    :parameters (?d - obj ?from - obj ?to - obj)
    :precondition (and
      (agent3-disk ?d)
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