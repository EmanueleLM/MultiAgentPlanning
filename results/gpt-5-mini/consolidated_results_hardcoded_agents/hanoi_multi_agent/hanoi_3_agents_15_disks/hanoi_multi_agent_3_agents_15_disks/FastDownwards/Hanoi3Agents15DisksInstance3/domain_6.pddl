(define (domain hanoi3agents15)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent1-move-on-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action agent1-move-on-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent1 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
      (empty ?from)
    )
  )

  (:action agent1-move-on-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action agent1-move-on-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
    )
  )

  (:action agent2-move-on-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action agent2-move-on-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent2 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
      (empty ?from)
    )
  )

  (:action agent2-move-on-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action agent2-move-on-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
    )
  )

  (:action agent3-move-on-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action agent3-move-on-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent3 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
      (empty ?from)
    )
  )

  (:action agent3-move-on-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action agent3-move-on-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on ?d ?d2)
      (top ?d ?to)
      (not (top ?d2 ?to))
    )
  )
)