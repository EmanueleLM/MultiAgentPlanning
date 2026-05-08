(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; structural relations
    (on-disk ?d - disk ?support - disk)  ;; ?d is immediately on top of disk ?support
    (on-peg  ?d - disk ?p - peg)         ;; ?d is immediately on top of peg ?p

    ;; top indicators (authoritative)
    (clear-disk ?d - disk)               ;; no disk sits on top of ?d
    (clear-peg  ?p - peg)                ;; no disk sits on top of peg ?p

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)      ;; ?d1 is smaller than ?d2

    ;; discrete stage/time control (one action per stage)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits on another disk, onto another disk (which must be top).
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
      ;; remove d from its current support and place on target disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the previous support (?from) becomes top (clear)
      (clear-disk ?from)

      ;; the target disk is no longer clear (has d on top)
      (not (clear-disk ?to))

      ;; d remains clear (it has no disk on top after move)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that sits on another disk, onto an empty peg.
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

      ;; the previous support (?from) becomes top
      (clear-disk ?from)

      ;; the peg is no longer empty
      (not (clear-peg ?topeg))

      ;; d remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg, onto a top disk.
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

      ;; the peg becomes empty
      (clear-peg ?frompeg)

      ;; the target disk is no longer clear
      (not (clear-disk ?to))

      ;; d remains clear (no disk on top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg, onto an empty peg.
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

      ;; source peg becomes empty
      (clear-peg ?frompeg)

      ;; target peg no longer empty
      (not (clear-peg ?topeg))

      ;; d remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)