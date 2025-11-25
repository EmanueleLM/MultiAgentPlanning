(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?support - disk)   ;; ?d immediately on top of disk ?support
    (on-peg  ?d - disk ?p - peg)          ;; ?d immediately on top of peg ?p

    (clear-disk ?d - disk)                ;; no disk sits on top of ?d (d is top of its stack)
    (clear-peg  ?p - peg)                 ;; no disk sits on top of peg ?p (peg is empty)

    (smaller ?d1 - disk ?d2 - disk)       ;; size ordering: ?d1 is smaller than ?d2

    (current ?s - stage)                  ;; current stage/timepoint
    (next ?s1 - stage ?s2 - stage)        ;; immediate successor relation between stages
  )

  ;; Move a top disk that currently sits on another disk ?from, onto another top disk ?to.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the support ?from loses the top disk and becomes clear
      (clear-disk ?from)

      ;; the target ?to is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage strictly
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that currently sits on another disk ?from, onto an empty peg ?topeg.
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?topeg)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?topeg)

      ;; the previous support ?from becomes top
      (clear-disk ?from)

      ;; the target peg is no longer empty
      (not (clear-peg ?topeg))

      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage strictly
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that currently sits on a peg ?frompeg, onto another top disk ?to.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?frompeg - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?frompeg)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?frompeg))
      (on-disk ?d ?to)

      ;; the source peg may become empty (true iff disk was the only disk on that peg)
      (clear-peg ?frompeg)

      ;; the target disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage strictly
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that currently sits on a peg ?frompeg, onto an empty peg ?topeg.
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?frompeg - peg ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?frompeg)
      (clear-disk ?d)
      (clear-peg ?topeg)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?frompeg))
      (on-peg ?d ?topeg)

      ;; source peg loses its top disk and becomes empty
      (clear-peg ?frompeg)

      ;; target peg is no longer empty
      (not (clear-peg ?topeg))

      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage strictly
      (not (current ?s))
      (current ?s2)
    )
  )
)