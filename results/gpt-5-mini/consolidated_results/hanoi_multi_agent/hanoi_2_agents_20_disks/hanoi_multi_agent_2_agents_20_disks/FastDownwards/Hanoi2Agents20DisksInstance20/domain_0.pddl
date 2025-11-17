(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; nothing on top of this disk
    (clear-disk ?d - disk)
    ;; peg has nothing on it
    (clear-peg ?p - peg)
    ;; size relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; which agents are allowed to move
    (can-move ?a - agent)
  )

  ;; Agent 1 actions (four movement shapes)
  (:action move_agent_1_peg_to_peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-peg ?to))
      (clear-peg ?from)
      (on-peg ?d ?to)
      ;; moved disk remains clear on top
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-disk ?to))
      (clear-peg ?from)
      (on-disk ?d ?to)
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?a - agent ?d - disk ?below - disk ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear-disk ?below)
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-disk ?d)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?a - agent ?d - disk ?below - disk ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear-disk ?below)
      (not (clear-disk ?to))
      (on-disk ?d ?to)
      (clear-disk ?d)
    )
  )

  ;; Agent 2 actions (same schemas but require agent_2 to be allowed)
  (:action move_agent_2_peg_to_peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-peg ?to))
      (clear-peg ?from)
      (on-peg ?d ?to)
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-disk ?to))
      (clear-peg ?from)
      (on-disk ?d ?to)
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?a - agent ?d - disk ?below - disk ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear-disk ?below)
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-disk ?d)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?a - agent ?d - disk ?below - disk ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear-disk ?below)
      (not (clear-disk ?to))
      (on-disk ?d ?to)
      (clear-disk ?d)
    )
  )
)