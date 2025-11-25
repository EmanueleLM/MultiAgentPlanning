(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations
    (on-disk ?d - disk ?support - disk)   ;; ?d is directly on top of disk ?support
    (on-peg  ?d - disk ?p - peg)          ;; ?d is directly on peg ?p

    ;; top/open indicators
    (clear-disk ?d - disk)                ;; nothing directly on top of ?d
    (clear-peg  ?p - peg)                 ;; peg ?p currently has no disks

    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage/time progression
    (current ?s - stage)                  ;; current stage/timepoint
    (next ?s1 - stage ?s2 - stage)        ;; successor relation between stages
  )

  ;; Move a top disk that is directly on a disk, onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)           ;; ?d must be the top disk
      (clear-peg ?topeg)        ;; destination peg must be empty
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support
      (not (on-disk ?d ?from))
      ;; place on peg
      (on-peg  ?d ?topeg)

      ;; source disk now has no disk on it
      (clear-disk ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?topeg))

      ;; moved disk remains clear (top)
      (clear-disk ?d)

      ;; advance stage (force discrete progression)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a disk, onto another disk (must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)         ;; destination disk must be top
      (smaller ?d ?to)         ;; cannot place larger on smaller
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support and add new
      (not (on-disk ?d ?from))
      (on-disk  ?d ?to)

      ;; source disk becomes clear (loses its top disk)
      (clear-disk ?from)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear (top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?frompeg - peg ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?frompeg)
      (clear-disk ?d)         ;; top on this peg (and since it's on-peg, it's the only disk)
      (clear-peg ?topeg)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove from source peg and add to destination peg
      (not (on-peg ?d ?frompeg))
      (on-peg  ?d ?topeg)

      ;; source peg becomes empty, destination becomes non-empty
      (clear-peg ?frompeg)
      (not (clear-peg ?topeg))

      ;; moved disk remains clear (top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, onto another disk (must be larger)
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
      ;; remove from peg, place on disk
      (not (on-peg ?d ?frompeg))
      (on-disk ?d ?to)

      ;; source peg becomes empty (because top was on-peg -> sole disk)
      (clear-peg ?frompeg)

      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear (top)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)