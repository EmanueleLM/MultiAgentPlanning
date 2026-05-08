(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement: directly on another disk or directly on a peg
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; top-of relations: a disk is clear if nothing is directly on it; a peg is clear if nothing is directly on it
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; size ordering: smaller x y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; explicit discrete stage/time progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move top disk from a disk to another disk (both are disks; target must be top)
  (:action move-disk-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)     ;; ?d is directly on ?from
      (clear-disk ?d)        ;; ?d is top (nothing on ?d)
      (clear-disk ?to)       ;; ?to is top (we will place ?d onto ?to)
      (smaller ?d ?to)       ;; size constraint: cannot place larger on smaller
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      ;; relocate ?d
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; moved disk remains top (no disk on it)
      (clear-disk ?d)
      ;; source disk becomes clear (nothing on it) after removal
      (clear-disk ?from)
      ;; target disk is no longer clear
      (not (clear-disk ?to))
      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move top disk from a disk to an empty peg
  (:action move-disk-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)       ;; target peg must be empty
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; moved disk remains clear
      (clear-disk ?d)
      ;; after removing ?d from ?from, ?from becomes clear
      (clear-disk ?from)
      ;; target peg now has a disk on it and is not clear
      (not (clear-peg ?to))
      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move top disk from a peg to a disk (target must be top and larger)
  (:action move-disk-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      ;; moved disk remains clear
      (clear-disk ?d)
      ;; the source peg becomes empty after removing its top disk
      (clear-peg ?from)
      ;; target disk no longer clear
      (not (clear-disk ?to))
      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move top disk from a peg to an empty peg
  (:action move-disk-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ;; moved disk remains clear
      (clear-disk ?d)
      ;; source peg becomes empty
      (clear-peg ?from)
      ;; target peg is no longer empty
      (not (clear-peg ?to))
      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)