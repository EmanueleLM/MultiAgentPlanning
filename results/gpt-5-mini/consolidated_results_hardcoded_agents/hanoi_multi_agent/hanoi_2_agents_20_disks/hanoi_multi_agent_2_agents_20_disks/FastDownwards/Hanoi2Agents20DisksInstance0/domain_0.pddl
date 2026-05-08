(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk small large peg)
  (:constants
    A B C D E F G H I J - small
    K L M N O P Q R S T - large
    base-left base-middle base-right - disk
    left middle right - peg
  )

  (:predicates
    (above ?u - disk ?l - disk)          ; ?u is immediately above ?l
    (top ?d - disk ?p - peg)            ; ?d is the top disk on peg ?p
    (smaller ?x - disk ?y - disk)       ; ?x is smaller than ?y (ordering)
  )

  ;; Agent 1 moves disks A..J (type small)
  (:action agent_1-move
    :parameters (?d - small ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; update top of source peg: remove top ?d and set ?below as new top
      (not (top ?d ?from))
      (top ?below ?from)

      ;; update top of destination peg: remove current top ?t and set ?d as new top
      (not (top ?t ?to))
      (top ?d ?to)

      ;; update immediate-above relations
      (not (above ?d ?below))
      (above ?d ?t)
    )
  )

  ;; Agent 2 moves disks K..T (type large)
  (:action agent_2-move
    :parameters (?d - large ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (top ?below ?from)
      (not (top ?t ?to))
      (top ?d ?to)
      (not (above ?d ?below))
      (above ?d ?t)
    )
  )
)