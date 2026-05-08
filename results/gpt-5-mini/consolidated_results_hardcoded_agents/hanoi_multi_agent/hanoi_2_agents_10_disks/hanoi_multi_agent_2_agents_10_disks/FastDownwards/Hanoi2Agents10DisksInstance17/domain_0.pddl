(define (domain multiagent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)        ;; disk ?d is immediately on place ?p (peg or disk)
    (clear ?p - place)              ;; place ?p has nothing on top (is clear)
    (can-move ?a - agent ?d - disk) ;; agent ?a is permitted to move disk ?d
    (smaller ?d1 - disk ?d2 - disk) ;; disk d1 is smaller than disk d2
  )

  ;; Agent 1: moves a disk (one-step) onto a peg
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: moves a disk (one-step) onto another disk (must be larger)
  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: moves a disk (one-step) onto a peg
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: moves a disk (one-step) onto another disk (must be larger)
  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)