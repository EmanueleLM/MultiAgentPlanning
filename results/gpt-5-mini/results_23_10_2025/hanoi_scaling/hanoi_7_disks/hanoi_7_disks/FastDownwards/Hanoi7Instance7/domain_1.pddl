(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; nothing is on top of place ?p (peg or disk)
    (clear ?p - place)
    ;; size order: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; move a top disk onto an empty peg
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
              ;; the place that supported the moved disk becomes clear
              (clear ?from)
              ;; the destination peg is no longer clear (has ?d on top)
              (not (clear ?to))
            )
  )

  ;; move a top disk onto another disk (only if smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?dest - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?dest)
                    (smaller ?d ?dest)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?dest)
              (clear ?from)
              (not (clear ?dest))
            )
  )
)