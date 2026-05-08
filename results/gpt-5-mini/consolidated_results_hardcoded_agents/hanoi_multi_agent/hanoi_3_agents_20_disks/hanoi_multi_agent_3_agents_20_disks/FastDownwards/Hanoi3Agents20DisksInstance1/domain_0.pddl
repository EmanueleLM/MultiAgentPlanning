(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?s - disk)     ; disk ?d is directly on disk ?s
    (clear-disk ?d - disk)            ; nothing is on top of disk ?d
    (clear-peg ?p - peg)              ; peg ?p has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk)   ; disk d1 is smaller than disk d2
    (assigned1 ?d - disk)             ; disk is controlled by agent_1
    (assigned2 ?d - disk)             ; disk is controlled by agent_2
    (assigned3 ?d - disk)             ; disk is controlled by agent_3
  )

  ;; Actions for agent_1 (controls disks marked assigned1)
  (:action agent_1-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (assigned1 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_1-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (assigned1 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action agent_1-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (assigned1 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_1-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (assigned1 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Actions for agent_2 (controls disks marked assigned2)
  (:action agent_2-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (assigned2 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_2-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (assigned2 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action agent_2-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (assigned2 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_2-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (assigned2 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Actions for agent_3 (controls disks marked assigned3)
  (:action agent_3-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (assigned3 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_3-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (assigned3 ?d) (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action agent_3-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (assigned3 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action agent_3-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (assigned3 ?d) (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to))
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

)