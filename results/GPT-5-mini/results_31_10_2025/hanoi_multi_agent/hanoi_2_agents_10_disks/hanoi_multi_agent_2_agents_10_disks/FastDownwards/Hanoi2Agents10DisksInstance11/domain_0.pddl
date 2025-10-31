(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg place)
  ;; disks and pegs are places
  (:predicates
    (on ?d - disk ?p - place)        ;; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ;; nothing on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ;; ?d1 is smaller than ?d2
    (can-move ?a - agent ?d - disk) ;; agent ?a is allowed to move disk ?d
  )

  ;; Agent 1: move a disk onto a peg
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 1: move a disk onto another disk (only if smaller)
  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2: move a disk onto a peg
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2: move a disk onto another disk (only if smaller)
  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)