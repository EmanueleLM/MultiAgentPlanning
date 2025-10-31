(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)           ; disk directly on a place (peg or disk)
    (clear ?p - place)                 ; nothing on top of this place (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2
    (agent1-disk ?d - disk)            ; disk moveable by agent_1
    (agent2-disk ?d - disk)            ; disk moveable by agent_2
  )

  ; Agent 1 moves a disk onto an empty peg
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 1 moves a disk onto another disk (must be smaller than target)
  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 2 moves a disk onto an empty peg
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 2 moves a disk onto another disk (must be smaller than target)
  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)