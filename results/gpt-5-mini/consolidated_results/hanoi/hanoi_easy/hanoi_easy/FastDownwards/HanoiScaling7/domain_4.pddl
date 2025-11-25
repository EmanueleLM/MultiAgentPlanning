(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; positional relations: a disk is either directly on a peg or directly on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?support - disk)

    ;; "clear" means there is no disk on top of that support (peg or disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering: smaller ?d1 ?d2 means d1 is smaller than d2
    (smaller ?d1 ?d2 - disk)

    ;; discrete step progression to enforce exact move count and contiguous stage occupancy
    (current-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; Move a top disk that is directly on a peg to another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)        ;; disk is directly on the source peg
      (clear-disk ?d)          ;; disk has nothing on top of it (it is top)
      (clear-peg ?to)          ;; destination peg currently has no disk on it
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; moved disk remains top (explicit)
      (clear-disk ?d)

      ;; destination peg is no longer clear; source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; advance the global step (enforces contiguous time progression)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk on another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)      ;; target disk has nothing on top of it
      (smaller ?d ?to)      ;; size constraint: cannot place larger on smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; moved disk is top after move (explicit)
      (clear-disk ?d)

      ;; placing onto a disk makes that disk no longer clear; source peg becomes clear
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; moved disk is top after move (explicit)
      (clear-disk ?d)

      ;; the disk that was supporting ?d becomes clear; destination peg is no longer clear
      (clear-disk ?from)
      (not (clear-peg ?to))

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; moved disk is top after move (explicit)
      (clear-disk ?d)

      ;; the former support becomes clear; the new support is no longer clear
      (clear-disk ?from)
      (not (clear-disk ?to))

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)