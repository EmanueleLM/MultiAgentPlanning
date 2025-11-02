(define (domain hanoi-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    peg - object
    disk - object
    agent1-disk agent2-disk agent3-disk - disk
  )

  (:predicates
    (on ?d - disk ?p - object)        ; disk d is directly on object p (disk or peg)
    (clear ?o - object)               ; nothing is on object o (top / peg empty)
    (smaller ?d - disk ?o - object)   ; disk d is smaller than object o (object may be disk or peg)
  )

  ; Agent-specific move actions. Each action allows only the corresponding agent's disks.
  (:action move-by-agent_1
    :parameters (?d - agent1-disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-by-agent_2
    :parameters (?d - agent2-disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-by-agent_3
    :parameters (?d - agent3-disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)