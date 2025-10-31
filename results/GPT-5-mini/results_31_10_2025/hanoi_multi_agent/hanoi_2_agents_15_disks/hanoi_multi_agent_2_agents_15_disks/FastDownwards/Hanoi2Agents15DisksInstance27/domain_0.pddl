(define (domain hanoi_domain)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is immediately on place ?p (disk or peg)
    (clear ?p - place)              ; nothing on top of place ?p (disk or peg)
    (smaller ?d1 - disk ?d2 - disk) ; disk d1 is strictly smaller than disk d2
    (allowed-by-agent1 ?d - disk)   ; agent_1 is allowed to move this disk
    (allowed-by-agent2 ?d - disk)   ; agent_2 is allowed to move this disk
  )

  ;; Moves where the destination is a peg
  (:action agent_1_move_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed-by-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent_2_move_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed-by-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Moves where the destination is another disk (requires size ordering)
  (:action agent_1_move_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (allowed-by-agent1 ?d)
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
      (clear ?d)
    )
  )

  (:action agent_2_move_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (allowed-by-agent2 ?d)
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
      (clear ?d)
    )
  )
)