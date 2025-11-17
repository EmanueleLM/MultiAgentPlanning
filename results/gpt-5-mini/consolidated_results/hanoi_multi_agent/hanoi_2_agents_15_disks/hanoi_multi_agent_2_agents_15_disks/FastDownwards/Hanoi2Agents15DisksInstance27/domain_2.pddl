(define (domain hanoi_2agents_15)
  (:requirements :typing :negative-preconditions)
  (:types place - object
          disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed-by-agent1 ?d - disk)
    (allowed-by-agent2 ?d - disk)
  )

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