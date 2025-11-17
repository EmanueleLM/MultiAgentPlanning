(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is immediately on place ?p (which can be a peg or another disk)
    (on ?d - disk ?p - place)
    ;; nothing is on top of place ?p (p can be a peg or a disk)
    (clear ?p - place)
    ;; size ordering: ?a is smaller than ?b (only asserted for disk pairs in the problem)
    (smaller ?a - place ?b - place)
    ;; movement permissions
    (agent1disk ?d - disk)
    (agent2disk ?d - disk)
  )

  ;; Agent 1 may only move disks A-E
  (:action move-agent1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      ;; disallow placing a larger disk onto a smaller disk:
      ;; (smaller ?to ?d) would mean ?to is smaller than ?d, so forbid that
      (not (smaller ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after move the moved disk is clear (nothing on top)
      (clear ?d)
      ;; the place it came from becomes clear
      (clear ?from)
      ;; the destination is no longer clear
      (not (clear ?to))
    )
  )

  ;; Agent 2 may only move disks F-J
  (:action move-agent2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (smaller ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )
)