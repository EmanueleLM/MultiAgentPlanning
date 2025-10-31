(define (domain tower-hanoi-2agents)
  ; Intended for Fast Downward (FastDownwards) planner
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p (i.e., bottom-most record)
    (on-disk ?d - disk ?d2 - disk)   ; disk ?d is directly on top of disk ?d2
    (clear-disk ?d - disk)           ; there is no disk on top of ?d
    (clear-peg ?p - peg)             ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
    (allowed ?a - agent ?d - disk)   ; agent ?a is allowed to move disk ?d
  )

  ;; -------------------------
  ;; Agent 1 move actions (allowed disks: A..J)
  ;; -------------------------

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move_agent_1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk
  (:action move_agent_1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a disk that is on another disk to an empty peg
  (:action move_agent_1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a disk that is on another disk onto another disk
  (:action move_agent_1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ;; -------------------------
  ;; Agent 2 move actions (allowed disks: K..T)
  ;; -------------------------

  (:action move_agent_2_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

) ; end domain