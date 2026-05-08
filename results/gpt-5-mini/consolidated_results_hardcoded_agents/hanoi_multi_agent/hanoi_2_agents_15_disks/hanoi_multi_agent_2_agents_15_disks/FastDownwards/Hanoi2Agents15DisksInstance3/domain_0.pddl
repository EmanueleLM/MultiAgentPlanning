(define (domain tower-of-hanoi-agent1)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; peg and disk are both subtypes of place for the second argument of on
  (:predicates
    (on ?d - disk ?p - place)       ; disk d is directly on place p (peg or disk)
    (clear ?p - place)             ; there is no disk on top of place p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: d1 is smaller than d2
  )

  ;; Move a disk onto an empty peg
  (:action agent_1_move_disk_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
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

  ;; Move a disk onto another disk (must be smaller than the target disk)
  (:action agent_1_move_disk_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
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