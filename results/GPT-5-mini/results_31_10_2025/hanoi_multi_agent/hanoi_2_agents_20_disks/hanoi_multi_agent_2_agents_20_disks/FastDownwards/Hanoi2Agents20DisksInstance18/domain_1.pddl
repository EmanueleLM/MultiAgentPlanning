(define (domain hanoi-2agents-20)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (top ?d - disk ?p - peg)                ; ?d is the top disk on peg ?p
    (support_disk ?d - disk ?under - disk) ; ?d is immediately supported by disk ?under
    (support_peg ?d - disk ?p - peg)       ; ?d is immediately supported by peg ?p
    (empty ?p - peg)                       ; peg has no disks
    (can_move_a1 ?d - disk)                ; agent_1 is allowed to move ?d
    (can_move_a2 ?d - disk)                ; agent_2 is allowed to move ?d
    (smaller ?x - disk ?y - disk)          ; ?x is smaller than ?y
  )

  ;; ACTIONS FOR AGENT 1: moving a disk that agent_1 can move
  ;; 1) From a peg where the moved disk is supported by another disk, to an empty peg
  (:action move_agent_1_from_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and (can_move_a1 ?d) (top ?d ?from) (support_disk ?d ?under) (empty ?to))
    :effect (and
      (not (top ?d ?from))
      (top ?d ?to)
      (not (support_disk ?d ?under))
      (support_peg ?d ?to)
      (not (empty ?to))
      (top ?under ?from)
    )
  )

  ;; 2) From a peg where the moved disk is directly on the peg, to an empty peg
  (:action move_agent_1_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can_move_a1 ?d) (top ?d ?from) (support_peg ?d ?from) (empty ?to))
    :effect (and
      (not (top ?d ?from))
      (top ?d ?to)
      (not (support_peg ?d ?from))
      (support_peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; 3) From a peg where the moved disk is supported by another disk, to a peg whose top is disk ?e
  (:action move_agent_1_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?from - peg ?e - disk ?to - peg)
    :precondition (and (can_move_a1 ?d) (top ?d ?from) (support_disk ?d ?under) (top ?e ?to) (smaller ?d ?e))
    :effect (and
      (not (top ?d ?from))
      (not (top ?e ?to))
      (top ?d ?to)
      (not (support_disk ?d ?under))
      (support_disk ?d ?e)
      (top ?under ?from)
    )
  )

  ;; 4) From a peg where the moved disk is directly on the peg, to a peg whose top is disk ?e
  (:action move_agent_1_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?e - disk ?to - peg)
    :precondition (and (can_move_a1 ?d) (top ?d ?from) (support_peg ?d ?from) (top ?e ?to) (smaller ?d ?e))
    :effect (and
      (not (top ?d ?from))
      (not (top ?e ?to))
      (top ?d ?to)
      (not (support_peg ?d ?from))
      (support_disk ?d ?e)
      (empty ?from)
    )
  )

  ;; ACTIONS FOR AGENT 2: same structure but enforcing agent_2 permissions
  (:action move_agent_2_from_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and (can_move_a2 ?d) (top ?d ?from) (support_disk ?d ?under) (empty ?to))
    :effect (and
      (not (top ?d ?from))
      (top ?d ?to)
      (not (support_disk ?d ?under))
      (support_peg ?d ?to)
      (not (empty ?to))
      (top ?under ?from)
    )
  )

  (:action move_agent_2_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can_move_a2 ?d) (top ?d ?from) (support_peg ?d ?from) (empty ?to))
    :effect (and
      (not (top ?d ?from))
      (top ?d ?to)
      (not (support_peg ?d ?from))
      (support_peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent_2_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?from - peg ?e - disk ?to - peg)
    :precondition (and (can_move_a2 ?d) (top ?d ?from) (support_disk ?d ?under) (top ?e ?to) (smaller ?d ?e))
    :effect (and
      (not (top ?d ?from))
      (not (top ?e ?to))
      (top ?d ?to)
      (not (support_disk ?d ?under))
      (support_disk ?d ?e)
      (top ?under ?from)
    )
  )

  (:action move_agent_2_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?e - disk ?to - peg)
    :precondition (and (can_move_a2 ?d) (top ?d ?from) (support_peg ?d ?from) (top ?e ?to) (smaller ?d ?e))
    :effect (and
      (not (top ?d ?from))
      (not (top ?e ?to))
      (top ?d ?to)
      (not (support_peg ?d ?from))
      (support_disk ?d ?e)
      (empty ?from)
    )
  )
)