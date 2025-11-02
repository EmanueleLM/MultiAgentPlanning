(define (domain hanoi)
  ;; Tower of Hanoi domain for Fast-Downward
  (:requirements :strips :typing :negative-preconditions)

  ;; Types: disks and pegs are both places
  (:types disk peg - place)

  (:predicates
    ;; a disk is directly on a place (another disk or a peg)
    (on ?d - disk ?p - place)
    ;; nothing is on top of this place (a place can be a disk or a peg)
    (clear ?p - place)
    ;; allowed placements: disk can be placed onto this place (peg or larger disk)
    (allowed ?d - disk ?p - place)
  )

  ;; Single move action. Action origin/orchestrator noted in name for traceability.
  ;; Preconditions:
  ;;   - disk is on the from-place,
  ;;   - disk is clear (top disk at its current place),
  ;;   - destination place is clear (no disk on top of it),
  ;;   - static allowed predicate holds (precomputed to prevent larger-on-smaller).
  ;; Effects:
  ;;   - disk is no longer on from-place, becomes on to-place,
  ;;   - to-place becomes not clear (it now has the moved disk on top),
  ;;   - from-place becomes clear (the top disk was removed).
  (:action move_orchestrator
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)