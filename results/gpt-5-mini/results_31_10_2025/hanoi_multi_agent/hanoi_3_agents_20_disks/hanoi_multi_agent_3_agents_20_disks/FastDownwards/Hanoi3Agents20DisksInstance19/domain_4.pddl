(define (domain hanoi_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)   ; ?d is directly on top of disk ?under
    (on-peg ?d - disk ?p - peg)         ; ?d is directly on peg ?p (bottom or alone)
    (clear-disk ?d - disk)              ; no disk on top of ?d
    (clear-peg ?p - peg)                ; peg ?p has no disks (top is empty)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (allowed_agent3 ?d - disk)
    (smaller ?x - disk ?y - disk)       ; ?x is smaller than ?y
  )

  ;; Moves where the moving disk is currently on top of another disk and is moved onto another disk
  (:action agent1_move_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?dest - disk)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?dest)
      (clear-disk ?under)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?dest - disk)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?dest)
      (clear-disk ?under)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  (:action agent3_move_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?dest - disk)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?dest)
      (clear-disk ?under)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  ;; Moves where the moving disk is currently on top of another disk and is moved onto an empty peg
  (:action agent1_move_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?p_to - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?p_to)
      (clear-disk ?under)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?p_to - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?p_to)
      (clear-disk ?under)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )

  (:action agent3_move_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?p_to - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?p_to)
      (clear-disk ?under)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )

  ;; Moves where the moving disk is currently on a peg and is moved onto another disk
  (:action agent1_move_from_peg_to_disk
    :parameters (?d - disk ?p_from - peg ?dest - disk)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-disk ?d ?dest)
      (clear-peg ?p_from)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_from_peg_to_disk
    :parameters (?d - disk ?p_from - peg ?dest - disk)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-disk ?d ?dest)
      (clear-peg ?p_from)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  (:action agent3_move_from_peg_to_disk
    :parameters (?d - disk ?p_from - peg ?dest - disk)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-disk ?d ?dest)
      (clear-peg ?p_from)
      (not (clear-disk ?dest))
      (clear-disk ?d)
    )
  )

  ;; Moves where the moving disk is currently on a peg and is moved onto an empty peg
  (:action agent1_move_from_peg_to_peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)
      (clear-peg ?p_from)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )

  (:action agent2_move_from_peg_to_peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)
      (clear-peg ?p_from)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )

  (:action agent3_move_from_peg_to_peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (on-peg ?d ?p_from)
      (clear-disk ?d)
      (clear-peg ?p_to)
      (allowed_agent3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)
      (clear-peg ?p_from)
      (not (clear-peg ?p_to))
      (clear-disk ?d)
    )
  )
)