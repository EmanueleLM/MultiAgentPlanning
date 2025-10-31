(define (domain tower-of-hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on-disk ?d - disk ?below - disk)   ; ?d is directly on top of ?below
    (on-peg ?d - disk ?p - peg)         ; ?d is directly on peg ?p (bottom disk)
    (top ?d - disk ?p - peg)            ; ?d is the top disk of peg ?p
    (empty ?p - peg)                    ; peg ?p is empty
    (smaller ?d1 - disk ?d2 - disk)     ; disk ?d1 is smaller than disk ?d2
  )

  ;; Move when the moved disk is the only disk on the source peg (on-peg)
  ;; and the destination peg is empty.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move when the moved disk has a disk below it on the source peg (on-disk)
  ;; and the destination peg is empty.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (top ?below ?from)
    )
  )

  ;; Move when the moved disk is the only disk on the source peg (on-peg)
  ;; and the destination peg has a top disk ?t (must be larger).
  (:action move-peg-to-onto
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (empty ?from)
    )
  )

  ;; Move when the moved disk has a disk below it on the source peg (on-disk)
  ;; and the destination peg has a top disk ?t (must be larger).
  (:action move-disk-to-onto
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )
)