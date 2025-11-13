(define (domain hanoi-15-single-move)
  ; Tower of Hanoi with 15 disks and 3 pegs.
  ; Constraints:
  ; - One-disk moves only.
  ; - A disk may be placed only on a peg or on a strictly larger disk.
  ; - Right peg must be empty in the goal (enforced by clear(right) in the goal).
  ; Notes:
  ; - We unify "on" for both disks and pegs via a supertype "support".
  ; - The static predicate can-stack(d, s) makes the single move operator legal
  ;   without ADL disjunctions: it is true for all pegs and for disk pairs (d, s)
  ;   exactly when (smaller d s) holds.

  (:requirements :strips :typing)

  (:types
    support
    disk peg - support
  )

  (:predicates
    ; on(x, s): disk x is directly on support s (a disk or a peg)
    (on ?x - disk ?s - support)
    ; clear(s): no disk is on top of support s (a disk or a peg)
    (clear ?s - support)
    ; smaller(x, y): disk x is strictly smaller than disk y (static)
    (smaller ?x - disk ?y - disk)
    ; can-stack(x, s): it is legal to place disk x onto support s (static)
    ; True for all pegs; for disks s it matches (smaller x s).
    (can-stack ?x - disk ?s - support)
  )

  (:action move
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)