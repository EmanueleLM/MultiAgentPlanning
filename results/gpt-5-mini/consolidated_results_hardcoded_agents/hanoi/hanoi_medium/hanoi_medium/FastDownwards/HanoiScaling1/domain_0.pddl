(define (domain tower-of-hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg - place)

  (:predicates
    ;; disk is immediately on a place (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing immediately on it (is top/empty)
    (clear ?p - place)
    ;; disk ordering: true when first is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Mover action: move a clear disk from its current support (peg or disk)
  ;; onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; remove old support link
      (not (on ?d ?from))
      ;; place disk on the target peg
      (on ?d ?to)
      ;; target peg is no longer empty
      (not (clear ?to))
      ;; support (whatever it was) becomes clear after removing the disk
      (clear ?from)
    )
  )

  ;; Mover action: move a clear disk from its current support (peg or disk)
  ;; onto the top of another clear disk, allowed only if moved disk is smaller.
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; remove old support link
      (not (on ?d ?from))
      ;; place disk on top of destination disk
      (on ?d ?to)
      ;; destination disk is no longer clear (it has a disk on it)
      (not (clear ?to))
      ;; support (whatever it was) becomes clear after removing the disk
      (clear ?from)
    )
  )
)