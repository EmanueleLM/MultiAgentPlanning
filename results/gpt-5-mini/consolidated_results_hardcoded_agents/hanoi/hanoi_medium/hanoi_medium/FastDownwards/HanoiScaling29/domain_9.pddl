(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - loc stage)

  (:predicates
    ;; disk ?d is directly on location ?p (p is either a peg or another disk)
    (on ?d - disk ?p - loc)
    ;; nothing is on top of location ?p (p may be a peg or a disk)
    (clear ?p - loc)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time modeling
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be a different location than the source)
  (:action move-to-peg
    :parameters (?d - disk ?from - loc ?peg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)                ;; disk ?d is directly on ?from
      (clear ?d)                   ;; ?d is the top disk at its source
      (clear ?peg)                 ;; target peg top must be clear (peg empty at top)
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?from ?peg))         ;; must move to a different location
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)                ;; the location it came from becomes clear
      (not (clear ?peg))           ;; target peg top becomes occupied
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the disk below)
  (:action move-to-disk
    :parameters (?d - disk ?from - loc ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)                ;; disk ?d is directly on ?from
      (clear ?d)                   ;; ?d is the top disk at its source
      (clear ?below)               ;; target disk must have nothing on it
      (smaller ?d ?below)          ;; size constraint: moved disk must be smaller
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?from ?below))       ;; cannot move onto the same location it is on
      (not (= ?d ?below))          ;; sanity: disk cannot be placed on itself
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?below)
      (clear ?from)                ;; the source location becomes clear after removal
      (not (clear ?below))         ;; target disk now has a disk on top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)