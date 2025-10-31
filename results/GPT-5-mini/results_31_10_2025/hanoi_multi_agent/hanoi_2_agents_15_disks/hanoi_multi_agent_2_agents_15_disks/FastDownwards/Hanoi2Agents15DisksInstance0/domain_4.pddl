(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place disk - object)

  (:constants agent_1 agent_2 orchestrator - agent)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (disk or place)
    (clear ?x - object)              ; nothing on top of object ?x (peg empty or disk has no disk on it)
    (can-move ?a - agent ?d - disk)  ; agent ?a is allowed to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)  ; disk d1 is smaller than disk d2
  )

  (:action move-agent1-to-place
    :parameters (?d - disk ?from - object ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-place
    :parameters (?d - disk ?from - object ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)