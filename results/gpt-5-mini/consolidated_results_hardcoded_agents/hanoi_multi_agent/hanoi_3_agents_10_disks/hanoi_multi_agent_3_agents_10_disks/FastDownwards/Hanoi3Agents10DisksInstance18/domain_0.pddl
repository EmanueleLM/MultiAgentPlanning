(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?p - object)        ; disk d is directly on object p (disk or peg)
    (clear ?p - object)              ; object p has nothing on top of it
    (can-place ?d - disk ?p - object) ; static: disk d may be placed on object p
    (can-move-agent1 ?d - disk)      ; disk is movable by agent_1
    (can-move-agent2 ?d - disk)      ; disk is movable by agent_2
    (can-move-agent3 ?d - disk)      ; disk is movable by agent_3
  )

  ;; Agent 1 moves (only disks a b c d)
  (:action agent_1-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 moves (only disks e f g)
  (:action agent_2-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 3 moves (only disks h i j)
  (:action agent_3-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)