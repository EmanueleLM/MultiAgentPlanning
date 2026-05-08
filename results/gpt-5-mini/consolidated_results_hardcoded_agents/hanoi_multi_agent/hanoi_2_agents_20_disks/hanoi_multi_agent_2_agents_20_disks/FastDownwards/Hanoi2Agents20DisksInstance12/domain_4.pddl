(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  ;; Actions for agent 1
  (:action move_disk_from_disk_to_peg_by_agent_1
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?below)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_disk_to_disk_by_agent_1
    :parameters (?d - disk ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?dst)
      (smaller ?d ?dst)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      (not (clear-disk ?dst))
      (clear-disk ?below)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_peg_to_peg_by_agent_1
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_peg_to_disk_by_agent_1
    :parameters (?d - disk ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?dst)
      (smaller ?d ?dst)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear-disk ?dst))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  ;; Actions for agent 2
  (:action move_disk_from_disk_to_peg_by_agent_2
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?below)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_disk_to_disk_by_agent_2
    :parameters (?d - disk ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?dst)
      (smaller ?d ?dst)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      (not (clear-disk ?dst))
      (clear-disk ?below)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_peg_to_peg_by_agent_2
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  (:action move_disk_from_peg_to_disk_by_agent_2
    :parameters (?d - disk ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?dst)
      (smaller ?d ?dst)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear-disk ?dst))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )
)