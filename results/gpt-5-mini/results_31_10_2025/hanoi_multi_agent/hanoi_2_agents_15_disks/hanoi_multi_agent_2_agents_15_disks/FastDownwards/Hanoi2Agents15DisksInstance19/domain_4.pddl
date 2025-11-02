(define (domain hanoi_2agents_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?o - object)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (smaller ?x - disk ?y - disk)
  )

  ;; Agent 1: move to an empty peg
  (:action agent1-move-to-empty
    :parameters (?d - disk ?from - object ?to - peg)
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
    )
  )

  ;; Agent 1: move onto another disk (must be larger)
  (:action agent1-move-onto-disk
    :parameters (?d - disk ?from - object ?top - disk ?under - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?top ?under)
      (clear ?top)
      (can-move-agent1 ?d)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
    )
  )

  ;; Agent 2: move to an empty peg
  (:action agent2-move-to-empty
    :parameters (?d - disk ?from - object ?to - peg)
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
    )
  )

  ;; Agent 2: move onto another disk (must be larger)
  (:action agent2-move-onto-disk
    :parameters (?d - disk ?from - object ?top - disk ?under - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?top ?under)
      (clear ?top)
      (can-move-agent2 ?d)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
    )
  )
)