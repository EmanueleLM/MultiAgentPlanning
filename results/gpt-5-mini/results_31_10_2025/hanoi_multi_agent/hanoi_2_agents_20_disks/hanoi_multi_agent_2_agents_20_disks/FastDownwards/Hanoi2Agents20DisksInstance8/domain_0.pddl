(define (domain hanoi_coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk on support (support can be a disk or a peg; use top-level object typing)
    (on ?d - disk ?s - object)
    ;; nothing directly on ?o (o can be a disk or a peg)
    (clear ?o - object)
    ;; disk size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?d1 - disk ?d2 - disk)
    ;; which agent is allowed to move which disk
    (allowed_agent_1 ?d - disk)
    (allowed_agent_2 ?d - disk)
  )

  ;; Agent 1 moves: four variants to avoid disjunctions (peg/disk as from/to)
  (:action move_agent_1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the support we removed ?d from becomes clear
      (clear ?from)
      ;; the destination is no longer clear
      (not (clear ?to))
      ;; the moved disk remains clear (top disk)
      (clear ?d)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (allowed_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (allowed_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed_agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2 moves: same schemas but guarded by allowed_agent_2
  (:action move_agent_2_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (allowed_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (allowed_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (allowed_agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

)