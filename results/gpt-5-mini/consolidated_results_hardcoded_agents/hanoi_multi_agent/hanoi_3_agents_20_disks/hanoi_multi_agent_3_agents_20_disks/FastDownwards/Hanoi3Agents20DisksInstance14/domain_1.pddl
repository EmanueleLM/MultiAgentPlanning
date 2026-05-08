(define (domain three-agent-hanoi-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)         ; disk ?d directly on peg ?p (bottom-most relation for that stack)
    (on-disk ?d - disk ?below - disk)  ; disk ?d directly on disk ?below
    (clear-disk ?d - disk)             ; no disk is on top of disk ?d
    (clear-peg ?p - peg)               ; no disk is directly on peg ?p
    (larger ?big - disk ?small - disk) ; ?big is larger than ?small
    (movable1 ?d - disk)               ; agent_1 permitted to move ?d
    (movable2 ?d - disk)               ; agent_2 permitted to move ?d
    (movable3 ?d - disk)               ; agent_3 permitted to move ?d
  )

  ;========================
  ; Agent 1 actions (allowed disks via (movable1 ?d))
  ; Four move schemas to cover moving between peg/disk combinations
  ;========================

  (:action move_agent_1_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-peg ?from)
    )
  )

  (:action move_agent_1_from_disk_to_peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-disk ?below)
    )
  )

  (:action move_agent_1_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-peg ?from)
    )
  )

  (:action move_agent_1_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-disk ?below)
    )
  )

  ;========================
  ; Agent 2 actions (require (movable2 ?d))
  ;========================

  (:action move_agent_2_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-peg ?from)
    )
  )

  (:action move_agent_2_from_disk_to_peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-disk ?below)
    )
  )

  (:action move_agent_2_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-peg ?from)
    )
  )

  (:action move_agent_2_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-disk ?below)
    )
  )

  ;========================
  ; Agent 3 actions (require (movable3 ?d))
  ;========================

  (:action move_agent_3_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-peg ?from)
    )
  )

  (:action move_agent_3_from_disk_to_peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (movable3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (clear-disk ?below)
    )
  )

  (:action move_agent_3_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-peg ?from)
    )
  )

  (:action move_agent_3_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?target)
      (larger ?target ?d)
      (movable3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (clear-disk ?target))
      (on-disk ?d ?target)
      (clear-disk ?below)
    )
  )

)