(define (domain hanoi-2agents-20)
  (:requirements :typing :negative-preconditions)

  (:types
    peg - object
    disk - object
    smalldisk largedisk - disk
  )

  (:predicates
    (on ?d - disk ?p - (either peg disk))
    (clear ?p - (either peg disk))
    (smaller ?s - disk ?b - disk)
    (can_move_by_1 ?d - disk)
    (can_move_by_2 ?d - disk)
  )

  (:action move_by_agent1_to_peg
    :parameters (?d - smalldisk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_by_agent1_to_disk
    :parameters (?d - smalldisk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_by_agent2_to_peg
    :parameters (?d - largedisk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_by_agent2_to_disk
    :parameters (?d - largedisk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)