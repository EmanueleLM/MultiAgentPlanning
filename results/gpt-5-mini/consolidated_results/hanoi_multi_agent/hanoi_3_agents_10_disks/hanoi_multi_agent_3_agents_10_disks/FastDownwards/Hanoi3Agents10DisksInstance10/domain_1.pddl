(define (domain hanoi-multiagent-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)                ; disk ?d is located on peg ?p
    (top ?d - disk ?p - peg)               ; ?d is the top disk on peg ?p
    (below ?upper - disk ?lower - disk)    ; ?lower is directly below ?upper (none for no disk below)
    (empty ?p - peg)                       ; peg ?p is empty
    (smaller ?d1 - disk ?d2 - disk)        ; ?d1 is smaller than ?d2
    (canmove1 ?d - disk)                   ; agent_1 may move this disk
    (canmove2 ?d - disk)                   ; agent_2 may move this disk
    (canmove3 ?d - disk)                   ; agent_3 may move this disk
  )

  ; -------- AGENT 1 actions (moves disks A-D) --------
  (:action move_agent_1_to_empty_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d ?ld)
      (canmove1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (not (below ?d ?ld))
      (top ?ld ?from)
    )
  )

  (:action move_agent_1_to_empty_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d none)
      (canmove1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent_1_onto_disk_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d ?ld)
      (smaller ?d ?t)
      (canmove1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (not (below ?d ?ld))
      (below ?d ?t)
      (top ?ld ?from)
    )
  )

  (:action move_agent_1_onto_disk_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d none)
      (smaller ?d ?t)
      (canmove1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (empty ?from)
      (below ?d ?t)
    )
  )

  ; -------- AGENT 2 actions (moves disks E-G) --------
  (:action move_agent_2_to_empty_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d ?ld)
      (canmove2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (not (below ?d ?ld))
      (top ?ld ?from)
    )
  )

  (:action move_agent_2_to_empty_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d none)
      (canmove2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent_2_onto_disk_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d ?ld)
      (smaller ?d ?t)
      (canmove2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (not (below ?d ?ld))
      (below ?d ?t)
      (top ?ld ?from)
    )
  )

  (:action move_agent_2_onto_disk_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d none)
      (smaller ?d ?t)
      (canmove2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (empty ?from)
      (below ?d ?t)
    )
  )

  ; -------- AGENT 3 actions (moves disks H-J) --------
  (:action move_agent_3_to_empty_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d ?ld)
      (canmove3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (not (below ?d ?ld))
      (top ?ld ?from)
    )
  )

  (:action move_agent_3_to_empty_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (below ?d none)
      (canmove3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent_3_onto_disk_with_below_disk
    :parameters (?d - disk ?from - peg ?to - peg ?ld - disk ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d ?ld)
      (smaller ?d ?t)
      (canmove3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (not (below ?d ?ld))
      (below ?d ?t)
      (top ?ld ?from)
    )
  )

  (:action move_agent_3_onto_disk_with_below_none
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (on ?t ?to)
      (top ?t ?to)
      (below ?d none)
      (smaller ?d ?t)
      (canmove3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))
      (empty ?from)
      (below ?d ?t)
    )
  )
)