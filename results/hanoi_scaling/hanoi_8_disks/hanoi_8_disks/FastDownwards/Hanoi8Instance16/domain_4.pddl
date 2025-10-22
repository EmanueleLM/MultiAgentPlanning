(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?d2 - disk)   ; disk d is directly on disk d2
    (on-peg  ?d - disk ?p - peg)     ; disk d is directly on peg p
    (clear-disk ?d - disk)           ; no disk on top of d
    (clear-peg ?p - peg)             ; peg has no disk (is empty)
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto a clear disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (clear-peg ?from)
      (not (clear-disk ?t))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?s - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?s)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?to)
      (clear-disk ?s)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a disk onto a clear disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?s - disk ?t - disk)
    :precondition (and
      (on-disk ?d ?s)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?t)
      (clear-disk ?s)
      (not (clear-disk ?t))
      (clear-disk ?d)
    )
  )
)