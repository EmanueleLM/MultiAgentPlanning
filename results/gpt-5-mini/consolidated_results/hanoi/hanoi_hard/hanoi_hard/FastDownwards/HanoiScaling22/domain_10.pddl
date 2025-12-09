(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (support-peg ?p - peg ?d - disk)
    (support-disk ?lower - disk ?upper - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is the sole disk on the source peg to an empty target peg
  (:action move-peg-bottom-to-empty
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-peg ?p1 ?d)
      (empty ?p2)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-peg ?p1 ?d))
      (empty ?p1)

      (not (empty ?p2))
      (top ?p2 ?d)
      (support-peg ?p2 ?d)

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ;; Move a top disk that is supported by another disk directly below it, to an empty target peg
  (:action move-disk-top-to-empty
    :parameters (?d - disk ?below - disk ?p1 - peg ?p2 - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-disk ?below ?d)
      (empty ?p2)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-disk ?below ?d))
      (top ?p1 ?below)

      (not (empty ?p2))
      (top ?p2 ?d)
      (support-peg ?p2 ?d)

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ;; Move a disk from a peg-bottom source onto a target peg whose top is the bottom disk (supported by the peg)
  (:action move-peg-bottom-to-disk-onto-bottom
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-peg ?p1 ?d)
      (top ?p2 ?dtgt)
      (support-peg ?p2 ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-peg ?p1 ?d))
      (empty ?p1)

      (not (top ?p2 ?dtgt))
      (not (support-peg ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)
      (not (empty ?p2))

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ;; Move a disk from a peg-bottom source onto a target whose top is supported by another disk
  (:action move-peg-bottom-to-disk-onto-disk
    :parameters (?d - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?belowt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-peg ?p1 ?d)
      (top ?p2 ?dtgt)
      (support-disk ?belowt ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-peg ?p1 ?d))
      (empty ?p1)

      (not (top ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)
      (not (empty ?p2))

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ;; Move a disk that is supported by another disk onto a target whose top is the bottom disk (supported by the peg)
  (:action move-disk-to-disk-onto-bottom
    :parameters (?d - disk ?below - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-disk ?below ?d)
      (top ?p2 ?dtgt)
      (support-peg ?p2 ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-disk ?below ?d))
      (top ?p1 ?below)

      (not (top ?p2 ?dtgt))
      (not (support-peg ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)
      (not (empty ?p2))

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )

  ;; Move a disk that is supported by another disk onto a target whose top is supported by another disk
  (:action move-disk-to-disk-onto-disk
    :parameters (?d - disk ?below - disk ?p1 - peg ?p2 - peg ?dtgt - disk ?belowt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p1 ?d)
      (support-disk ?below ?d)
      (top ?p2 ?dtgt)
      (support-disk ?belowt ?dtgt)
      (smaller ?d ?dtgt)
      (at-stage ?s) (succ ?s ?s2)
    )
    :effect (and
      (not (top ?p1 ?d))
      (not (support-disk ?below ?d))
      (top ?p1 ?below)

      (not (top ?p2 ?dtgt))
      (top ?p2 ?d)
      (support-disk ?dtgt ?d)
      (not (empty ?p2))

      (not (at-stage ?s)) (at-stage ?s2)
    )
  )
)