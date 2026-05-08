(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?below - disk)  ; ?d is directly on ?below
    (on-peg  ?d - disk ?p - peg)       ; ?d is directly on peg ?p

    ;; the current top disk of a peg
    (top ?d - disk ?p - peg)           ; disk ?d is the top disk of peg ?p

    ;; peg emptiness
    (empty ?p - peg)                   ; peg ?p currently has no disks

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on a peg onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
      (empty ?from)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on another disk onto the top disk of another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
    )
  )
)