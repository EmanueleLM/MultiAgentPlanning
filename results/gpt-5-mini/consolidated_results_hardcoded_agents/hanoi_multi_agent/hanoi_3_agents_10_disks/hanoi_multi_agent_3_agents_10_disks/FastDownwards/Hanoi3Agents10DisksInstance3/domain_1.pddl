(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg place)
  ;; disk and peg are subtypes of place (use naming convention in objects)
  ;; (PDDL typing with simple declarations below; disks and pegs will be declared in the problem.)
  (:predicates
    (on ?d - disk ?p - place)       ; disk d is directly on place p (peg or disk)
    (clear ?p - place)             ; nothing is on top of place p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk); d1 is smaller than d2
    (can-move ?a - agent ?d - disk) ; agent a is permitted to move disk d
  )

  ;; Actions are split so size constraints only apply when placing onto a disk.
  ;; Agent 1 actions
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can-move agent_1 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can-move agent_1 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 actions
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can-move agent_2 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can-move agent_2 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3 actions
  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can-move agent_3 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can-move agent_3 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)