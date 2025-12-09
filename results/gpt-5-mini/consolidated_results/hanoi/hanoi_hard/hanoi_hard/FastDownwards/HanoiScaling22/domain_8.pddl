(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; support relations: a peg supports a disk (bottom disk), or a disk supports another disk directly above it
    (support-peg ?p - peg ?d - disk)
    (support-disk ?lower - disk ?upper - disk)

    ; top-of-peg: which disk is currently top on a peg (only present if peg non-empty)
    (top ?p - peg ?d - disk)
    ; empty peg marker (mutually exclusive with a top predicate for the same peg)
    (empty ?p - peg)

    ; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ; discrete stage/time progression
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ; Move a top disk that is directly supported by the source peg, placing onto an empty target peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-peg ?p1 ?d)
      (empty ?p2)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      ; source peg loses its top disk and becomes empty
      (not (top ?p1 ?d))
      (not (support-peg ?p1 ?d))
      (empty ?p1)

      ; target peg becomes non-empty with d as top and supported by the peg
      (not (empty ?p2))
      (top ?p2 ?d)
      (support-peg ?p2 ?d)

      ; advance stage
      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ; Move a top disk that is directly supported by the source peg, placing onto a non-empty target peg (onto its top disk ?dtgt)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-peg ?p1 ?d)
      (top ?p2 ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      ; remove d from source peg; source becomes empty
      (not (top ?p1 ?d))
      (not (support-peg ?p1 ?d))
      (empty ?p1)

      ; update target peg: previous top ?dtgt is no longer top; d becomes new top supported by dtgt
      (not (top ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)

      ; advance stage
      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ; Move a top disk that is directly supported by another disk ?below, placing onto an empty target peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p1 - peg ?p2 - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-disk ?below ?d)
      (empty ?p2)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      ; remove d from top of source; the disk below becomes new top of source
      (not (top ?p1 ?d))
      (not (support-disk ?below ?d))
      (top ?p1 ?below)

      ; target peg becomes non-empty with d as top supported by peg
      (not (empty ?p2))
      (top ?p2 ?d)
      (support-peg ?p2 ?d)

      ; advance stage
      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ; Move a top disk that is directly supported by another disk ?below, placing onto a non-empty target peg (onto its top disk ?dtgt)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-disk ?below ?d)
      (top ?p2 ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      ; remove d from top of source; disk below becomes new top
      (not (top ?p1 ?d))
      (not (support-disk ?below ?d))
      (top ?p1 ?below)

      ; update target peg: previous top ?dtgt is no longer top; d becomes new top supported by dtgt
      (not (top ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)

      ; advance stage
      (not (at-stage ?s)) (at-stage ?s2)
    )
  )
)