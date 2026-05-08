(define (domain hanoi-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    peg - object
    disk - object
    agent1-disk agent2-disk agent3-disk - disk
  )

  (:predicates
    (on ?d - disk ?x - object)        ; disk d is directly on object x (disk or peg)
    (clear ?o - object)               ; nothing is on object o (it is top / peg empty)
    (smaller ?d - disk ?x - object)   ; disk d is smaller than object x (disk or peg)
  )

  ;; move actions for agent_1 (disks A..G)
  (:action move-by-agent_1
    :parameters (?d - agent1-disk ?from - object ?to - object)
    :precondition (and
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

  ;; move actions for agent_2 (disks H..N)
  (:action move-by-agent_2
    :parameters (?d - agent2-disk ?from - object ?to - object)
    :precondition (and
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

  ;; move actions for agent_3 (disks O..T)
  (:action move-by-agent_3
    :parameters (?d - agent3-disk ?from - object ?to - object)
    :precondition (and
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