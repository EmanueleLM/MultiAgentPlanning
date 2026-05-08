(define (domain hanoi_coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types object peg disk)
  (:predicates
    (on ?d - disk ?x - object)            ; disk d is directly on object x (peg or disk)
    (clear ?x - object)                  ; nothing is on top of object x
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
  )

  ;; Agent 1 moves: may move allowed disks onto an empty peg or onto another disk (if smaller)
  (:action agent_1-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (agent1_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_1-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (agent1_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 moves: may move allowed disks onto an empty peg or onto another disk (if smaller)
  (:action agent_2-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (agent2_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_2-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (agent2_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)