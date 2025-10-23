(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ; nothing is on top of place ?p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)  ; disk ?d1 is strictly smaller than disk ?d2 (static)
  )

  ;; Agent-distinct move actions.
  ;; Each agent has two move schemas:
  ;;  - moving a disk onto a peg
  ;;  - moving a disk onto another disk
  ;; Preconditions enforce: moving only a clear disk, destination clear,
  ;; cannot move onto same place, and (for disk destinations) size constraint.
  ;; Effects maintain on/clear relations so only one disk moves at a time
  ;; and larger-on-smaller is prevented by preconditions.

  ;; Left peg agent actions
  (:action move-by-left-agent-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-left-agent-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Middle peg agent actions
  (:action move-by-middle-agent-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-middle-agent-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Right peg agent actions
  (:action move-by-right-agent-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-right-agent-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

)