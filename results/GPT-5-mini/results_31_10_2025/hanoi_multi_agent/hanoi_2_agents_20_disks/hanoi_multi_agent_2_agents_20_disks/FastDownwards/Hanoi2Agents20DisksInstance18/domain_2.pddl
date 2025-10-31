(define (domain hanoi-2agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (top ?d - disk ?p - peg)
    (support_disk ?d - disk ?under - disk)
    (support_peg ?d - disk ?p - peg)
    (empty ?p - peg)
    (can_move_a1 ?d - disk)
    (can_move_a2 ?d - disk)
    (smaller ?x - disk ?y - disk)
  )

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