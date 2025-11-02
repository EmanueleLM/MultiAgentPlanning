(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:predicates
    ;; a disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it (it is clear / top)
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; remove old placement and add new placement
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination now has a disk on top, so it is not clear
      (not (clear ?to))
      ;; the source place (disk or peg) becomes clear after removing the top disk
      (clear ?from)
    )
  )

  ;; Move a top disk onto another top disk (requires smaller-than relation)
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