(define (domain hanoi_two_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move_agent1_from_disk_onto_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  (:action move_agent1_from_peg_onto_empty
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent1_from_disk_onto_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  (:action move_agent1_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (empty ?from)
    )
  )

  (:action move_agent2_from_disk_onto_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  (:action move_agent2_from_peg_onto_empty
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent2_from_disk_onto_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  (:action move_agent2_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (empty ?from)
    )
  )
)