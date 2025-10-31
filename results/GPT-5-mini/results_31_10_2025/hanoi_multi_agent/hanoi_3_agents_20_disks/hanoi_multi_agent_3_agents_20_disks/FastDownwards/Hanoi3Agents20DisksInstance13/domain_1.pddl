(define (domain hanoi_agents_3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is immediately on place ?p (place = peg or disk)
    (clear ?p - place)               ; nothing on top of place ?p (top of a peg or a disk)
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is strictly smaller than d2
    (can_move_agent_1 ?d - disk)
    (can_move_agent_2 ?d - disk)
    (can_move_agent_3 ?d - disk)
  )

  ;; agent_1: move to an empty peg
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; agent_1: move onto another disk (only if ?d smaller than ?to)
  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; agent_2: move to an empty peg
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; agent_2: move onto another disk
  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; agent_3: move to an empty peg
  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; agent_3: move onto another disk
  (:action move_agent_3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_agent_3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)