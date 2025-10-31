(define (domain hanoi-multiagent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk) ; agent ?a is allowed to move disk ?d
  )

  ;; Agent 1: move a disk to an empty peg
  (:action move-agent_1-to-peg
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 1: move a disk onto another disk (requires size ordering)
  (:action move-agent_1-to-disk
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2: move a disk to an empty peg
  (:action move-agent_2-to-peg
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2: move a disk onto another disk (requires size ordering)
  (:action move-agent_2-to-disk
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
      (not (clear ?to))
      (clear ?from)
    )
  )
)