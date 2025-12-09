(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk support relations: a disk is directly on a peg or on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ;; topology predicates: disk has nothing on top, peg has no disks
    (clear-disk ?d - disk)
    (empty-peg ?p - peg)

    ;; size ordering (smaller means first argument is strictly smaller)
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit stage progression
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a disk that is the only disk on a source peg to an empty destination peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (clear-disk ?d)
      (empty-peg ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; move relations
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)

      ;; update clear / empty bookkeeping
      (not (clear-disk ?d))
      (not (empty-peg ?dst))
      (empty-peg ?src)
    )
  )

  ;; Move a top disk that is on another disk to an empty destination peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (empty-peg ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; move relations
      (not (on-disk ?d ?below))
      (on-peg ?d ?dst)

      ;; update clear / empty bookkeeping
      (not (clear-disk ?d))
      (not (empty-peg ?dst))
      (clear-disk ?below)
    )
  )

  ;; Move a disk that is the only disk on a source peg onto a (clear) disk target.
  (:action move-peg-to-disk
    :parameters (?d - disk ?src - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (clear-disk ?d)
      (clear-disk ?td)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; move relations
      (not (on-peg ?d ?src))
      (on-disk ?d ?td)

      ;; update clear / empty bookkeeping
      (not (clear-disk ?d))
      (not (clear-disk ?td))
      (empty-peg ?src)
    )
  )

  ;; Move a top disk that is on another disk onto another (clear) disk target.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?td)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; move relations
      (not (on-disk ?d ?below))
      (on-disk ?d ?td)

      ;; update clear / empty bookkeeping
      (not (clear-disk ?d))
      (not (clear-disk ?td))
      (clear-disk ?below)
    )
  )
)