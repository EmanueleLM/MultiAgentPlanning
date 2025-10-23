(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on a place (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; the place (peg or disk) has nothing on top of it (is top)
    (clear ?p - place)
    ;; size ordering: smaller d1 d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)       ;; only top disk can be moved
      (clear ?to)      ;; peg must be empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d, the place it was on becomes clear
      (clear ?from)
      ;; the destination peg is no longer clear
      (not (clear ?to))
      ;; moved disk remains topmost (clear)
      (clear ?d)
    )
  )

  ;; Move a top disk onto another disk (stacking). Enforce size constraint.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)            ;; only top disk can be moved
      (clear ?target)       ;; target disk must be top
      (smaller ?d ?target)  ;; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      ;; after removing ?d, the place it was on becomes clear
      (clear ?from)
      ;; the target disk now has something on top and is not clear
      (not (clear ?target))
      ;; moved disk is topmost (clear)
      (clear ?d)
    )
  )
)