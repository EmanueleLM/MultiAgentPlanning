(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    loc
    peg - loc
    disk - loc
    disk_a disk_b disk_c - disk
  )

  (:predicates
    (on ?d - disk ?loc - loc)
    (clear ?loc - loc)
    (smaller ?a - loc ?b - loc)
  )

  ;; Agent 1 moves (allowed disks A..G)
  (:action move_agent_1
    :parameters (?d - disk_a ?from - loc ?to - loc)
    :precondition (and
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

  ;; Agent 2 moves (allowed disks H..N)
  (:action move_agent_2
    :parameters (?d - disk_b ?from - loc ?to - loc)
    :precondition (and
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

  ;; Agent 3 moves (allowed disks O..T)
  (:action move_agent_3
    :parameters (?d - disk_c ?from - loc ?to - loc)
    :precondition (and
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