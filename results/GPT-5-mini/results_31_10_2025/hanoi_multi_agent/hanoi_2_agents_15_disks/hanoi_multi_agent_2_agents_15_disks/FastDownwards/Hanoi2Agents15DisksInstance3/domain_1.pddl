(define (domain tower-of-hanoi-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)     ; disk d is directly on place p (peg or disk)
    (clear ?p - place)           ; nothing on top of place p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: d1 is smaller than d2
    (allowed1 ?d - disk)         ; agent_1 is allowed to move this disk
    (allowed2 ?d - disk)         ; agent_2 is allowed to move this disk
  )

  ;; agent_1 moves a disk onto an empty peg
  (:action agent_1_move_disk_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_1 moves a disk onto another disk (must be smaller than the target disk)
  (:action agent_1_move_disk_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (allowed1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 moves a disk onto an empty peg
  (:action agent_2_move_disk_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 moves a disk onto another disk (must be smaller than the target disk)
  (:action agent_2_move_disk_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (allowed2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)