(define (domain hanoi_2agents_20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)            ; disk ?d is directly on object ?x (disk or peg)
    (clear-disk ?d - disk)               ; no disk on top of ?d
    (clear-peg ?p - peg)                 ; peg ?p has no disk on it
    (smaller ?a - disk ?b - disk)        ; disk ?a is smaller than disk ?b
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
  )

  ;; Agent 1 actions (moves only disks A-J)
  (:action agent1_move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action agent1_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action agent1_move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action agent1_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; Agent 2 actions (moves only disks K-T)
  (:action agent2_move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )
)