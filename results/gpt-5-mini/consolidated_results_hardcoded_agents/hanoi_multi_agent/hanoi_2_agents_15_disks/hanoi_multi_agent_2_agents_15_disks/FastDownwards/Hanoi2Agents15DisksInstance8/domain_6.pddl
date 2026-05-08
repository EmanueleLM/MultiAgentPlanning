(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 moves (only disks A-H)
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_1_onto_disk
    :parameters (?d - disk ?from - place ?dst - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (allowed_agent1 ?d)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )

  ;; Agent 2 moves (only disks I-O)
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent_2_onto_disk
    :parameters (?d - disk ?from - place ?dst - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (allowed_agent2 ?d)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )
)