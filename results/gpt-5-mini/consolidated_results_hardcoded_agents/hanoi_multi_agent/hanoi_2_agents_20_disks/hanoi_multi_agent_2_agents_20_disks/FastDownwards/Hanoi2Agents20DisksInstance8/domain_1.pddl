(define (domain hanoi_coop_2agents20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk on disk and disk on peg (two relations to avoid a common 'object' type)
    (on_disk ?d - disk ?s - disk)
    (on_peg ?d - disk ?p - peg)

    ;; clear predicates for disks and pegs
    (clear_disk ?d - disk)
    (clear_peg ?p - peg)

    ;; ordering: smaller X Y means X is strictly smaller than Y
    (smaller ?x - disk ?y - disk)

    ;; agent move permissions
    (allowed_agent_1 ?d - disk)
    (allowed_agent_2 ?d - disk)
  )

  ;; Agent 1 action schemas (four variants to cover all support combinations)
  (:action move_agent_1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed_agent_1 ?d)
      (on_peg ?d ?from)
      (clear_disk ?d)
      (clear_peg ?to)
    )
    :effect (and
      (not (on_peg ?d ?from))
      (on_peg ?d ?to)
      (clear_peg ?from)
      (not (clear_peg ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (allowed_agent_1 ?d)
      (on_peg ?d ?from)
      (clear_disk ?d)
      (clear_disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on_peg ?d ?from))
      (on_disk ?d ?to)
      (clear_peg ?from)
      (not (clear_disk ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (allowed_agent_1 ?d)
      (on_disk ?d ?from)
      (clear_disk ?d)
      (clear_peg ?to)
    )
    :effect (and
      (not (on_disk ?d ?from))
      (on_peg ?d ?to)
      (clear_disk ?from)
      (not (clear_peg ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed_agent_1 ?d)
      (on_disk ?d ?from)
      (clear_disk ?d)
      (clear_disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on_disk ?d ?from))
      (on_disk ?d ?to)
      (clear_disk ?from)
      (not (clear_disk ?to))
      (clear_disk ?d)
    )
  )

  ;; Agent 2 action schemas (same as agent 1 but guarded by allowed_agent_2)
  (:action move_agent_2_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed_agent_2 ?d)
      (on_peg ?d ?from)
      (clear_disk ?d)
      (clear_peg ?to)
    )
    :effect (and
      (not (on_peg ?d ?from))
      (on_peg ?d ?to)
      (clear_peg ?from)
      (not (clear_peg ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (allowed_agent_2 ?d)
      (on_peg ?d ?from)
      (clear_disk ?d)
      (clear_disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on_peg ?d ?from))
      (on_disk ?d ?to)
      (clear_peg ?from)
      (not (clear_disk ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (allowed_agent_2 ?d)
      (on_disk ?d ?from)
      (clear_disk ?d)
      (clear_peg ?to)
    )
    :effect (and
      (not (on_disk ?d ?from))
      (on_peg ?d ?to)
      (clear_disk ?from)
      (not (clear_peg ?to))
      (clear_disk ?d)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed_agent_2 ?d)
      (on_disk ?d ?from)
      (clear_disk ?d)
      (clear_disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on_disk ?d ?from))
      (on_disk ?d ?to)
      (clear_disk ?from)
      (not (clear_disk ?to))
      (clear_disk ?d)
    )
  )
)