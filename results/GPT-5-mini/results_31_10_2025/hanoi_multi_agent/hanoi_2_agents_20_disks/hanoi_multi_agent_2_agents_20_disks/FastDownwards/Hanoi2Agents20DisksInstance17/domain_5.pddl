(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (top ?p - peg ?d - disk)
    (below ?d - disk ?d2 - disk)
    (on-peg-base ?d - disk ?p - peg)
    (empty ?p - peg)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move_agent1_from_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and (can-move-agent1 ?d) (top ?from ?d) (below ?d ?under) (empty ?to))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (below ?d ?under))
      (top ?from ?under)
      (not (empty ?to))
    )
  )

  (:action move_agent1_from_disk_to_nonempty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topto - disk)
    :precondition (and (can-move-agent1 ?d) (top ?from ?d) (below ?d ?under) (top ?to ?topto) (smaller ?d ?topto))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (below ?d ?under))
      (top ?from ?under)
      (not (top ?to ?topto))
      (below ?d ?topto)
    )
  )

  (:action move_agent1_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can-move-agent1 ?d) (top ?from ?d) (on-peg-base ?d ?from) (empty ?to))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on-peg-base ?d ?from))
      (on-peg-base ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent1_from_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?topto - disk)
    :precondition (and (can-move-agent1 ?d) (top ?from ?d) (on-peg-base ?d ?from) (top ?to ?topto) (smaller ?d ?topto))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on-peg-base ?d ?from))
      (not (top ?to ?topto))
      (below ?d ?topto)
      (empty ?from)
    )
  )

  (:action move_agent2_from_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and (can-move-agent2 ?d) (top ?from ?d) (below ?d ?under) (empty ?to))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (below ?d ?under))
      (top ?from ?under)
      (not (empty ?to))
    )
  )

  (:action move_agent2_from_disk_to_nonempty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topto - disk)
    :precondition (and (can-move-agent2 ?d) (top ?from ?d) (below ?d ?under) (top ?to ?topto) (smaller ?d ?topto))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (below ?d ?under))
      (top ?from ?under)
      (not (top ?to ?topto))
      (below ?d ?topto)
    )
  )

  (:action move_agent2_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can-move-agent2 ?d) (top ?from ?d) (on-peg-base ?d ?from) (empty ?to))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on-peg-base ?d ?from))
      (on-peg-base ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent2_from_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?topto - disk)
    :precondition (and (can-move-agent2 ?d) (top ?from ?d) (on-peg-base ?d ?from) (top ?to ?topto) (smaller ?d ?topto))
    :effect (and
      (not (top ?from ?d))
      (top ?to ?d)
      (not (on-peg-base ?d ?from))
      (not (top ?to ?topto))
      (below ?d ?topto)
      (empty ?from)
    )
  )
)