(define (domain hanoi-2agents-20)
  (:requirements :typing :negative-preconditions)

  (:types
    peg - object
    disk - object
    smalldisk largedisk - disk
  )

  (:predicates
    ;; disk on another disk
    (on ?d - disk ?below - disk)
    ;; disk on a peg
    (on-peg ?d - disk ?p - peg)
    ;; clear means no disk on top of that disk / peg
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?s - disk ?b - disk)
    (can_move_by_1 ?d - disk)
    (can_move_by_2 ?d - disk)
  )

  ;; Agent 1 actions (smalldisk)
  (:action move_agent1_from_peg_to_peg
    :parameters (?d - smalldisk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent1_from_disk_to_peg
    :parameters (?d - smalldisk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
    )
  )

  (:action move_agent1_from_peg_to_disk
    :parameters (?d - smalldisk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent1_from_disk_to_disk
    :parameters (?d - smalldisk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
    )
  )

  ;; Agent 2 actions (largedisk)
  (:action move_agent2_from_peg_to_peg
    :parameters (?d - largedisk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent2_from_disk_to_peg
    :parameters (?d - largedisk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
    )
  )

  (:action move_agent2_from_peg_to_disk
    :parameters (?d - largedisk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent2_from_disk_to_disk
    :parameters (?d - largedisk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
    )
  )
)