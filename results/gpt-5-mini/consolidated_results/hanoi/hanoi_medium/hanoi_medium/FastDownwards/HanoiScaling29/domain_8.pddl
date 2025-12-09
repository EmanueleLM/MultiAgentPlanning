(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - loc stage)

  (:predicates
    ;; disk d is directly on location p (p is either a peg or another disk)
    (on ?d - disk ?p - loc)
    ;; nothing is on top of location p (p may be a peg or a disk)
    (clear ?p - loc)
    ;; size ordering: smaller d1 than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time modeling
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto a peg
  (:action move-to-peg
    :parameters (?d - disk ?from - loc ?peg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)         ;; disk ?d is directly on ?from
      (clear ?d)            ;; ?d is the top disk where it sits
      (clear ?peg)          ;; target peg top must be clear
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)         ;; the place it came from becomes clear
      (not (clear ?peg))    ;; peg top becomes occupied
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the disk below)
  (:action move-to-disk
    :parameters (?d - disk ?from - loc ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)         ;; disk ?d is directly on ?from
      (clear ?d)            ;; ?d is top at its source
      (clear ?below)        ;; target disk must have nothing on it
      (smaller ?d ?below)   ;; size constraint: cannot place larger on smaller
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?below)
      (clear ?from)         ;; the source becomes clear
      (not (clear ?below))  ;; target disk now has a disk on top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)