(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on some place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it (is top/clear)
    (clear ?p - place)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; remove old support
      (not (on ?d ?from))
      ;; new support
      (on ?d ?to)
      ;; destination is no longer clear
      (not (clear ?to))
      ;; the former support becomes clear (we moved the top disk)
      (clear ?from)
      ;; the moved disk remains clear (it is on top)
      (clear ?d)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than destination disk).
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
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
      (clear ?d)
    )
  )
)