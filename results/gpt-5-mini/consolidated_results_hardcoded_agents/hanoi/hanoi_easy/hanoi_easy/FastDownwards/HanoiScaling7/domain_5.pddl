(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; placement relations
    (on-peg ?d - disk ?p - peg)     ;; disk is directly on a peg (i.e., bottom disk on that peg)
    (on-disk ?d - disk ?support - disk) ;; disk is directly on another disk

    ;; "clear" means there is no disk directly on top of that support (peg or disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 ?d2 - disk)

    ;; discrete step progression
    (current-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; Move a top disk that is directly on a peg to another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)        ;; disk is directly on the source peg (the only disk on that peg)
      (clear-disk ?d)          ;; disk is top (nothing above it)
      (clear-peg ?to)          ;; destination peg empty (no disk on it)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg now occupied, source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk is top (maintain clear marker)
      (clear-disk ?d)

      ;; advance step (enforce contiguous progression)
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
      (smaller ?d ?to)      ;; cannot place larger on smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; placing onto a disk makes that disk no longer clear; source peg becomes clear
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk is top
      (clear-disk ?d)

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

      ;; the former support disk becomes clear (no disk on top of it now)
      (clear-disk ?from)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)

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

      ;; the former support becomes clear; the new support is no longer clear
      (clear-disk ?from)
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)