(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk directly on a place (disk or peg)
    (clear ?p - place)              ; nothing directly on this place (disk or peg)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (can_move_agent1 ?d - disk)     ; agent_1 allowed to move this disk
    (can_move_agent2 ?d - disk)     ; agent_2 allowed to move this disk
    (can_move_agent3 ?d - disk)     ; agent_3 allowed to move this disk
  )

  ;; Agent 1 moves
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 moves
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3 moves
  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)