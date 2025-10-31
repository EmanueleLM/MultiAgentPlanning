(define (domain hanoi_multiagent_3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg disk - place
    disk1 disk2 disk3 - disk
  )

  (:predicates
    ;; disk is on a place (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; top-of-place (peg or disk) is clear (no disk on it)
    (clear ?p - place)
    ;; size relation: ?d1 is smaller than ?d2 (so ?d1 can be placed on ?d2)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 actions: allowed to move disks A..G (type disk1)
  (:action agent_1_move-to-peg
    :parameters (?d - disk1 ?from - place ?to - peg)
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

  (:action agent_1_move-to-disk
    :parameters (?d - disk1 ?from - place ?to - disk)
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

  ;; Agent 2 actions: allowed to move disks H..N (type disk2)
  (:action agent_2_move-to-peg
    :parameters (?d - disk2 ?from - place ?to - peg)
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

  (:action agent_2_move-to-disk
    :parameters (?d - disk2 ?from - place ?to - disk)
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

  ;; Agent 3 actions: allowed to move disks O..T (type disk3)
  (:action agent_3_move-to-peg
    :parameters (?d - disk3 ?from - place ?to - peg)
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

  (:action agent_3_move-to-disk
    :parameters (?d - disk3 ?from - place ?to - disk)
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