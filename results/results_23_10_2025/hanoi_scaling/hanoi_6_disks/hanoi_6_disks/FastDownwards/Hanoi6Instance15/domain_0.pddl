(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - thing agent)

  (:predicates
    ;; x (disk) is directly on p (a thing: disk or peg)
    (on ?d - disk ?p - thing)
    ;; nothing is on top of this thing (either a disk or a peg)
    (clear ?p - thing)
    ;; d is smaller than p (p may be a disk or a peg). This enforces the size constraint.
    (smaller ?d - disk ?p - thing)
  )

  ;; Move any top disk ?d from some support ?from (a disk or a peg) onto some support ?to (a disk or a peg).
  ;; Preconditions:
  ;;   - ?d must currently be directly on ?from
  ;;   - ?d must be clear (no disk on top of it) so it is the top disk of its stack
  ;;   - ?to must be clear (either an empty peg or the top disk of another stack)
  ;;   - ?d must be smaller than ?to (this enforces that a larger disk is never placed on a smaller disk).
  ;; Effects:
  ;;   - the direct support relation is updated (remove on ?d ?from, add on ?d ?to)
  ;;   - ?to is no longer clear (it now has ?d on top)
  ;;   - ?from becomes clear (since ?d was on top of ?from, removing ?d makes ?from clear)
  (:action move-top
    :parameters (?d - disk ?from - thing ?to - thing)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)