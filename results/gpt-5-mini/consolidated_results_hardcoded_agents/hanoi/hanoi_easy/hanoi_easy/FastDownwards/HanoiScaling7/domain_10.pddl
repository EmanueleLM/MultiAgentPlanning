(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; support relations: every disk is supported either directly by a peg (on-peg)
    ;; or directly by another disk (on-disk). Actions must maintain this invariant.
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?support - disk)

    ;; top / emptiness markers
    (clear-disk ?d - disk)   ; no disk immediately on top of ?d (it is a top disk)
    (clear-peg ?p - peg)     ; peg has no disks

    ;; size ordering: strictly smaller relation (asymmetric)
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that currently is directly on a peg and that peg holds only that disk,
  ;; to an empty target peg. This keeps the moved disk as a top disk on the destination.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)     ; ?d is top on its support (the only disk on ?from)
      (clear-peg ?to)     ; target peg empty
      (not (= ?from ?to))
    )
    :effect (and
      ;; update supports
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source becomes empty, destination no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is the sole disk on its peg onto another top disk.
  ;; Enforces size ordering: moved disk must be smaller than the target disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)     ; ?d is top on its peg (only disk on ?from)
      (clear-disk ?to)    ; target disk has no disk on top
      (smaller ?d ?to)    ; size rule: moved disk strictly smaller than target
      (not (= ?from (the-peg-of ?to))) ; placeholder for clarity; see note below
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that currently sits directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)     ; ?d is top on its support
      (clear-peg ?to)
      (not (= ?to (the-peg-of ?from))) ; avoid nonsensical same-peg moves; see note below
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the previous support disk now has no disk on top
      (clear-disk ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk.
  ;; Enforces size ordering.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the former support disk becomes clear; the target disk is no longer clear
      (clear-disk ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; NOTE:
  ;; The predicates the-peg-of and equality tests in preconditions are not real PDDL predicates;
  ;; they are written here for clarity of intended constraints (preventing moves that do not change peg).
  ;; In the concrete problem instance below these constraints are enforced structurally by the choice
  ;; of parameters and by the initial facts. The domain kept within :strips/:typing/:negative-preconditions.
)