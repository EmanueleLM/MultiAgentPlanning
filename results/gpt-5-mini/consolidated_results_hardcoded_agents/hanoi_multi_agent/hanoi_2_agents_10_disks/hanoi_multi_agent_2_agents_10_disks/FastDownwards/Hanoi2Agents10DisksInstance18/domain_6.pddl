(define (domain hanoi2agents10)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move-agent1 ?d)
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

  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move-agent2 ?d)
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