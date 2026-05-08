(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:constants agent_1 agent_2 agent_3 - agent)

  (:predicates
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  ;; Agent 1 actions
  (:action move_agent_1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can-move agent_1 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (can-move agent_1 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (can-move agent_1 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (can-move agent_1 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ;; Agent 2 actions
  (:action move_agent_2_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can-move agent_2 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (can-move agent_2 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (can-move agent_2 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (can-move agent_2 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ;; Agent 3 actions
  (:action move_agent_3_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (can-move agent_3 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_3_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (can-move agent_3 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_3_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (can-move agent_3 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move_agent_3_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (can-move agent_3 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )
)