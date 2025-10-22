(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; a disk is on either a peg or another disk
    (on ?d - disk ?x - (either disk peg))
    ;; something (disk or peg) is clear (no disk on top)
    (clear ?x - (either disk peg))
    ;; size ordering: first disk is strictly smaller than second disk
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target peg now has a disk on top, so it's not clear
      (not (clear ?to))
      ;; whatever ?d was on becomes clear (whether a disk or a peg)
      (clear ?from)
      ;; moved disk is on top and thus clear
      (clear ?d)
    )
  )

  ;; Move a top disk onto another top disk (only allowed if moving disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target disk is no longer clear (has a disk on top)
      (not (clear ?to))
      ;; whatever ?d was on becomes clear
      (clear ?from)
      ;; moved disk is on top and thus clear
      (clear ?d)
    )
  )
)