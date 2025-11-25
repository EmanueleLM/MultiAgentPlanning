(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; structural placement
    (on-disk ?d - disk ?p - disk)   ;; disk ?d directly on disk ?p
    (on-peg  ?d - disk ?p - peg)    ;; disk ?d directly on peg ?p

    ;; top/open indicators
    (clear-disk ?d - disk)          ;; no disk directly on ?d
    (clear-peg  ?p - peg)           ;; peg ?p has no disks (empty)

    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage/time progression
    (current ?s - stage)            ;; current stage
    (next ?s1 - stage ?s2 - stage)  ;; successor relation between stages
  )

  ;; move a top disk that is directly on another disk, onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?topeg)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg  ?d ?topeg)

      ;; update clear/peg status
      (clear-disk ?from)
      (not (clear-peg ?topeg))

      ;; moved disk remains clear (nothing placed on it)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that is directly on another disk, onto another disk (must be larger)
  (:action move-disk-to-disk
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
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; update clear status
      (clear-disk ?from)
      (not (clear-disk ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that is directly on a peg, onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?frompeg - peg ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?frompeg)
      (clear-disk ?d)
      (clear-peg ?topeg)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?frompeg))
      (on-peg  ?d ?topeg)

      ;; source peg becomes empty, destination becomes non-empty
      (clear-peg ?frompeg)
      (not (clear-peg ?topeg))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that is directly on a peg, onto another disk (must be larger)
  (:action move-peg-to-disk
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
      ;; relocate disk
      (not (on-peg ?d ?frompeg))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?frompeg)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)