(define (domain hanoi_multiagent_15)
  (:requirements :strips :typing)
  (:types
    place
    peg - place
    disk - place
    disk_small - disk
    disk_large - disk
  )

  (:predicates
    (on ?d - disk ?p - place)        ; immediate support: disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p (if p is a disk it means that disk is top; if p is a peg it means peg empty)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 is smaller than ?d2
  )

  ; Agent 1 actions: may move only small disks (A..H)
  (:action move_agent1_to_peg
    :parameters (?d - disk_small ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent1_to_disk
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Agent 2 actions: may move only large disks (I..O)
  (:action move_agent2_to_peg
    :parameters (?d - disk_large ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent2_to_disk
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
      (not (clear ?to))
      (clear ?from)
    )
  )

)