(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
  )

  (:predicates
    ;; disk d is immediately supported by place p (p is either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; nothing is on top of place p (so p is available as a destination)
    (clear ?p - place)
    ;; size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk ?d from some supporter ?from (a peg or a disk)
  ;; onto an empty peg ?to.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)     ;; ?d is immediately on ?from (so ?from is the support)
      (clear ?d)        ;; ?d is the top disk on its stack (nothing on top of it)
      (clear ?to)       ;; the target peg has nothing on it (empty)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the former supporter ?from now has nothing on it (becomes clear)
      (clear ?from)
      ;; the target peg is no longer clear because ?d is now on it
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d from some supporter ?from onto a top disk ?to (which must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)     ;; ?d is immediately on ?from
      (clear ?d)        ;; ?d is top on its stack
      (clear ?to)       ;; ?to has nothing on it (so you place on top of ?to)
      (smaller ?d ?to)  ;; size constraint: cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the former supporter ?from becomes clear (nothing directly on it anymore)
      (clear ?from)
      ;; the new supporter ?to is not clear anymore
      (not (clear ?to))
    )
  )
)