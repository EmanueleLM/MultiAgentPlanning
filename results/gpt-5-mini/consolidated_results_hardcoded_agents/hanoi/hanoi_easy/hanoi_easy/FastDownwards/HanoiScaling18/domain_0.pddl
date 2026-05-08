(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk d is directly on place p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has no disk directly on top of it
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)    ;; disk is on the source place
      (clear ?d)       ;; disk is the top disk of its stack (no disk on top of it)
      (clear ?to)      ;; destination peg top is clear
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; destination peg top becomes occupied
      (clear ?from)      ;; source place becomes clear after removing ?d
    )
  )

  ;; Move a top disk onto another disk, allowed only if moved disk is smaller
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)       ;; disk is on the source place
      (clear ?d)          ;; disk is the top disk of its stack
      (clear ?to)         ;; destination disk has nothing on it
      (smaller ?d ?to)    ;; size constraint: moving disk is smaller than destination disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; destination disk no longer clear
      (clear ?from)      ;; source place becomes clear after removing ?d
    )
  )
)