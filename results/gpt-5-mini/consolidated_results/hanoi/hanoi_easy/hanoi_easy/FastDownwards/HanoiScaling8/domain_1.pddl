(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    time
  )

  (:predicates
    ;; disk D is directly on place P at time T (P may be a peg or another disk)
    (on ?d - disk ?p - place ?t - time)
    ;; place P has nothing directly on top of it at time T (i.e., top position at P is free)
    (clear ?p - place ?t - time)
    ;; size ordering: (smaller x y) means disk x is strictly smaller than disk y
    (smaller ?x - disk ?y - disk)
    ;; successor relation over discrete time points
    (succ ?t - time ?s - time)
  )

  ;; Move a top disk onto an empty peg, from time T to its successor S.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (clear ?d ?t)          ;; disk is top of its stack at time T
      (clear ?peg ?t)        ;; target peg top is free at time T (peg empty or top free)
      (succ ?t ?s)
    )
    :effect (and
      ;; disk located on target peg at successor time
      (on ?d ?peg ?s)
      ;; the place it came from has its top position free at S
      (clear ?from ?s)
      ;; target peg top is now occupied at S (not clear)
      (not (clear ?peg ?s))
      ;; moved disk remains top at S
      (clear ?d ?s)
    )
  )

  ;; Move a top disk onto another disk (must be larger), advancing from T to S.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (clear ?d ?t)
      (clear ?to ?t)           ;; the target disk has no disk on top at time T
      (smaller ?d ?to)         ;; size ordering: d is smaller than to
      (succ ?t ?s)
    )
    :effect (and
      (on ?d ?to ?s)
      (clear ?from ?s)
      (not (clear ?to ?s))
      (clear ?d ?s)
    )
  )

  ;; Copy action for a disk that remains in the same place and was top at time T.
  ;; This preserves continuity of occupancy for top disks across the time step.
  (:action copy-top
    :parameters (?d - disk ?p - place ?t - time ?s - time)
    :precondition (and
      (on ?d ?p ?t)
      (clear ?d ?t)
      (succ ?t ?s)
    )
    :effect (and
      (on ?d ?p ?s)
      (clear ?d ?s)
      ;; if a disk remains on p at S, then p is not clear at S
      (not (clear ?p ?s))
    )
  )

  ;; Copy action for a disk that remains in the same place and was NOT top at time T.
  ;; This preserves continuity for disks that have a disk above them.
  (:action copy-not-top
    :parameters (?d - disk ?p - place ?t - time ?s - time)
    :precondition (and
      (on ?d ?p ?t)
      (not (clear ?d ?t))
      (succ ?t ?s)
    )
    :effect (and
      (on ?d ?p ?s)
      ;; if a disk has something on top at S, then it is not clear at S
      (not (clear ?d ?s))
      ;; place p continues to be not clear at S (because this disk is on it)
      (not (clear ?p ?s))
    )
  )
)