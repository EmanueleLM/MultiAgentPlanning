(define (domain hanoi_2agents_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object
          place - object) ; place is a supertype; we'll use disks and pegs as places

  (:predicates
    ;; disk is immediately on place (a disk or a peg)
    (on ?d - disk ?p - place)

    ;; nothing on top of this place (either a disk or a peg)
    (clear ?p - place)

    ;; size ordering: ?d1 strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; agent permissions
    (allowed-by-agent1 ?d - disk)
    (allowed-by-agent2 ?d - disk)
  )

  ;; agent_1: move a disk onto an empty peg
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed-by-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; agent_1: move a disk onto another disk (destination disk must be larger)
  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (allowed-by-agent1 ?d)
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
      (clear ?d)
    )
  )

  ;; agent_2: move a disk onto an empty peg
  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed-by-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; agent_2: move a disk onto another disk (destination disk must be larger)
  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (allowed-by-agent2 ?d)
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
      (clear ?d)
    )
  )
)