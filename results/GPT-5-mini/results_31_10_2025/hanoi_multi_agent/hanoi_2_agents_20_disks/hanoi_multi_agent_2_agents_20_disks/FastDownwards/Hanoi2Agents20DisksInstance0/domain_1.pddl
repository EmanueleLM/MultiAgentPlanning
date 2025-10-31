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
    (above ?u - disk ?l - disk)   ; ?u is immediately above ?l
    (top ?d - disk ?p - peg)      ; ?d is the current top disk of peg ?p
    (smaller ?x - disk ?y - disk) ; size order: ?x is smaller than ?y
  )

  ;; Agent 1 can move only small disks (A..J)
  (:action agent_1-move
    :parameters (?d - small ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (top ?d ?from)          ; ?d is top of source peg
      (above ?d ?below)       ; ?d is immediately above ?below (below may be base sentinel)
      (top ?t ?to)            ; ?t is current top disk on destination peg (may be base sentinel)
      (smaller ?d ?t)         ; cannot place a larger disk on a smaller one
    )
    :effect (and
      ;; update top of source peg
      (not (top ?d ?from))
      (top ?below ?from)

      ;; update top of destination peg
      (not (top ?t ?to))
      (top ?d ?to)

      ;; update immediate-above relations
      (not (above ?d ?below))
      (above ?d ?t)
    )
  )

  ;; Agent 2 can move only large disks (K..T)
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