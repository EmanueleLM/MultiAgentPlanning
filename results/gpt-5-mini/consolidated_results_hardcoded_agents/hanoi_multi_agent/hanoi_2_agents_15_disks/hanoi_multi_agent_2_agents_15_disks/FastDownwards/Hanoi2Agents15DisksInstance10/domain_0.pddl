(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are places (so a disk can be a placement target)
  ;; PDDL typing: declare disk and peg as subtypes of place by convention:
  ;; (In many planners this is represented as 'disk - place' and 'peg - place',
  ;; but for compatibility we list the types and will use them consistently.)
  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (either a peg or a disk)
    (clear ?p - place)                  ; place ?p has nothing on top (peg empty or disk is top)
    (can-move-agent1 ?d - disk)         ; agent_1 is permitted to move disk ?d
    (can-move-agent2 ?d - disk)         ; agent_2 is permitted to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)     ; disk d1 is smaller than disk d2
  )

  ;; Actions are kept distinct per agent: move-agent1-* and move-agent2-*
  ;; Two variants for moving: to an empty peg, and onto a disk (which enforces size constraint).
  ;; move to peg (requires destination peg to be clear)
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (clear ?d))
    )
  )

  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (clear ?d))
    )
  )

  ;; move onto a disk (destination disk must be clear and larger than the moving disk)
  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (clear ?d))
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (clear ?d))
    )
  )
)