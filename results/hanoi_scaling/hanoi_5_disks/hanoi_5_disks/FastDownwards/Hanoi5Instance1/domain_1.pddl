(define (domain hanoi5)
  :requirements :strips :typing :negative-preconditions
  :types disk peg

  :predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (bottom-most on that peg)
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on top of disk ?under
    (top ?d - disk ?p - peg)          ; disk ?d is the top disk on peg ?p
    (clear-disk ?d - disk)            ; no disk on top of ?d (so ?d is movable)
    (clear-peg ?p - peg)              ; peg ?p is empty (no disks)

  ; Move a top disk that is directly on a peg to an empty peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (clear-peg ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (top ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ; Move a top disk that is directly on a peg onto another top disk
  (:action move-onpeg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (clear-disk ?d)
      (not (= ?from ?to))
      ; size constraint: ?d must be smaller than ?t
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (clear-disk ?t))
      (clear-peg ?from)
    )
  )

  ; Move a top disk that sits on another disk to an empty peg
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear-disk ?under)
      (top ?d ?to)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk that sits on another disk onto another top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (top ?t ?to)
      (not (= ?from ?to))
      ; size constraint
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear-disk ?under)
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (clear-disk ?t))
    )
  )
)