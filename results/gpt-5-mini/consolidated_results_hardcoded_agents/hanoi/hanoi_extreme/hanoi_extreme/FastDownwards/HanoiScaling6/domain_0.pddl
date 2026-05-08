(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; a disk is on a place (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; nothing on top of this place (place can be a disk or a peg)
    (clear ?p - place)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a single top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after placing ?d on ?to its target is no longer clear
      (not (clear ?to))
      ;; the source becomes clear (whether it was a peg or disk under ?d)
      (clear ?from)
    )
  )

  ;; Move a single top disk onto another disk (target disk must be clear and larger)
  (:action move-to-disk
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
    )
  )
)