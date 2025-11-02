(define (domain hanoi_multiagent10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)               ; place ?p has nothing on top of it
    (smaller ?d - disk ?p - place)   ; disk ?d is smaller than place ?p (disk or peg)
    (can_move_by_agent1 ?d - disk)   ; disk ?d may be moved by agent_1
    (can_move_by_agent2 ?d - disk)   ; disk ?d may be moved by agent_2
  )

  ;; Agent 1 move: limited to disks marked as movable by agent_1
  (:action agent_1_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 move: limited to disks marked as movable by agent_2
  (:action agent_2_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)