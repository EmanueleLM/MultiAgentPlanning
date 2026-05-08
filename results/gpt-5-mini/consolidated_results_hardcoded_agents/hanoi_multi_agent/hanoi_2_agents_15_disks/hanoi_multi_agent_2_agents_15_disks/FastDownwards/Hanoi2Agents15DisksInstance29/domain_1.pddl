(define (domain hanoi_multiagent_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg - place
    disk - place
    disk_small - disk
    disk_large - disk
  )

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (a peg or a disk)
    (clear ?p - place)              ; nothing is on top of place ?p (if p is a disk it means that disk is top; if p is a peg it means peg top is free)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 is smaller than ?d2
  )

  ;; Actions for agent_1: may move only small disks (A..H)
  (:action move_agent_1_to_peg
    :parameters (?d - disk_small ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?d - disk_small ?from - place ?to - disk)
    :precondition (and
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
    )
  )

  ;; Actions for agent_2: may move only large disks (I..O)
  (:action move_agent_2_to_peg
    :parameters (?d - disk_large ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk_large ?from - place ?to - disk)
    :precondition (and
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
    )
  )
)