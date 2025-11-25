(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (is-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)

    ;; positional relations
    (on-disk ?d - disk ?below - disk)   ;; ?d is directly on top of ?below
    (on-peg ?d - disk ?p - peg)         ;; ?d is directly on the peg (no disk below)
    (top ?d - disk ?p - peg)            ;; ?d is the top disk of peg ?p
    (empty ?p - peg)                    ;; peg is empty (no disks)

    ;; ordering and auxiliary
    (smaller ?d1 - disk ?d2 - disk)     ;; ?d1 is smaller than ?d2
    (different ?p1 - peg ?p2 - peg)     ;; pegs differ
  )

  ;; Move a disk that is on another disk, onto another disk
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from its current position
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      ;; the disk below becomes the new top of the from peg
      (top ?below ?from)

      ;; place d onto t on the destination peg
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)

      ;; destination is no longer empty (if it was)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is on another disk, onto an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from its current stack
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (top ?below ?from)

      ;; place d onto the empty peg
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move a disk that is directly on a peg, onto another disk
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from the from peg (making it empty)
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      ;; place d onto t on the destination peg
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)

      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on a peg, onto an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from the from peg (making it empty)
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      ;; place d onto the empty destination peg
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )
)