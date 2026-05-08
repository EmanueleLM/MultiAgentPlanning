(define (domain hanoi7)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; immediate support relations
    (on ?d - disk ?s - disk)         ; disk ?d is directly on disk ?s
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p

    ;; top/emptiness bookkeeping
    (top ?d - disk ?p - peg)         ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p contains no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Action variants exhaustively cover the cases needed to keep bookkeeping explicit and atomic:
  ;; - source support is either a peg or another disk
  ;; - destination is either empty or has a top disk
  ;; Each action moves exactly one top disk and updates on/on-peg/top/empty facts so invariants hold.

  ;; 1) Source: disk is directly on a peg. Destination: peg is empty.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove old support and top mark
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; destination gets disk as on-peg and top; destination ceases to be empty
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; source peg becomes empty (since ?d was the only disk sitting on the peg)
      (empty ?from)
    )
  )

  ;; 2) Source: disk is directly on a peg. Destination: peg has a top disk ?t (must be larger than ?d).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove old support and top mark
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; place d on top of t and update top-mark of destination
      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; source peg becomes empty
      (empty ?from)
    )
  )

  ;; 3) Source: disk is directly on another disk ?s. Destination: peg is empty.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on ?d ?s)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove the support link from d to s and remove d's top-mark at source
      (not (on ?d ?s))
      (not (top ?d ?from))

      ;; place d on the empty destination peg and mark it top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; since s was directly under d, after removing d, s becomes the top disk on the source peg
      (top ?s ?from)
    )
  )

  ;; 4) Source: disk is directly on another disk ?s. Destination: peg has a top disk ?t (t must be larger than d).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on ?d ?s)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove old support and source top mark
      (not (on ?d ?s))
      (not (top ?d ?from))

      ;; place d on t and update destination top
      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; s becomes new top on the source peg
      (top ?s ?from)
    )
  )

)