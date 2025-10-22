(define (domain hanoi8)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk is directly on the peg (i.e., bottom-most disk on that peg)
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?below - disk)
    ;; ?d is the top disk on peg ?p
    (top-of-peg ?d - disk ?p - peg)
    ;; peg is empty
    (empty ?p - peg)
    ;; static size ordering: ?a is strictly smaller than ?b
    (smaller-than ?a - disk ?b - disk)
  )

  ; Move a top disk that is the bottom-of-peg (on-peg) to an empty destination peg.
  (:action move-bottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source
      (not (top-of-peg ?d ?from))
      (not (on-peg ?d ?from))
      ;; source becomes empty
      (empty ?from)
      ;; place on destination
      (not (empty ?to))
      (on-peg ?d ?to)
      (top-of-peg ?d ?to)
    )
  )

  ; Move a top disk that is the bottom-of-peg (on-peg) onto another top disk on non-empty destination.
  (:action move-bottom-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?dtop - disk)
    :precondition (and
      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (top-of-peg ?dtop ?to)
      (smaller-than ?d ?dtop)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source
      (not (top-of-peg ?d ?from))
      (not (on-peg ?d ?from))
      ;; source becomes empty (since it was the only disk on-peg)
      (empty ?from)
      ;; place on top of destination disk
      (not (top-of-peg ?dtop ?to))
      (on-disk ?d ?dtop)
      (top-of-peg ?d ?to)
    )
  )

  ; Move a top disk that is on another disk to an empty destination peg.
  (:action move-on-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source stack
      (not (top-of-peg ?d ?from))
      (not (on-disk ?d ?below))
      ;; the disk below becomes the new top on source peg
      (top-of-peg ?below ?from)
      ;; place on destination peg (was empty)
      (not (empty ?to))
      (on-peg ?d ?to)
      (top-of-peg ?d ?to)
    )
  )

  ; Move a top disk that is on another disk to a non-empty destination (onto its top disk).
  (:action move-on-disk-to-nonempty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?dtop - disk)
    :precondition (and
      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (top-of-peg ?dtop ?to)
      (smaller-than ?d ?dtop)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source stack
      (not (top-of-peg ?d ?from))
      (not (on-disk ?d ?below))
      ;; the disk below becomes the new top on source peg
      (top-of-peg ?below ?from)
      ;; place on the top of destination disk
      (not (top-of-peg ?dtop ?to))
      (on-disk ?d ?dtop)
      (top-of-peg ?d ?to)
    )
  )
)