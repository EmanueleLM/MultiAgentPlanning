(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; placement relations: a disk is directly supported either by a peg or by another disk
    (on-peg ?d - disk ?p - peg)        ;; disk ?d is directly on peg ?p (i.e., the bottom disk of that peg if any)
    (on-disk ?d - disk ?support - disk) ;; disk ?d is directly on top of disk ?support

    ;; "clear" means there is nothing directly on top of that support (peg or disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; static size relation: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 ?d2 - disk)

    ;; discrete step progression: exactly one current-step holds; actions must advance to succ step
    (current-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)        ;; disk is directly on the source peg
      (clear-disk ?d)          ;; disk is top (nothing above it)
      (clear-peg ?to)          ;; destination peg empty (no disk directly on it)
    )
    :effect (and
      ;; update placement: remove from source peg, put on destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes occupied; source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains top (nothing on it)
      (clear-disk ?d)

      ;; advance step (enforce contiguous progression; only one current-step holds)
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
      (on-peg ?d ?from)    ;; disk is directly on source peg
      (clear-disk ?d)      ;; disk is top (nothing above it)
      (clear-disk ?to)     ;; target disk has nothing on top of it
      (smaller ?d ?to)     ;; size ordering: moved disk smaller than target disk
    )
    :effect (and
      ;; update placement: remove from source peg, place on target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; target disk is no longer clear; source peg becomes clear
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
      (on-disk ?d ?from)   ;; disk is directly on another disk
      (clear-disk ?d)      ;; disk is top (nothing above it)
      (clear-peg ?to)      ;; destination peg empty
    )
    :effect (and
      ;; update placement: remove from supporting disk, place on destination peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the former support disk becomes clear (no disk on it now)
      (clear-disk ?from)

      ;; destination peg becomes occupied
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
      (on-disk ?d ?from)   ;; disk is directly on support disk ?from
      (clear-disk ?d)      ;; disk is top
      (clear-disk ?to)     ;; destination disk is top
      (smaller ?d ?to)     ;; size ordering
    )
    :effect (and
      ;; update placement: remove from old support, put on new support
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; old support becomes clear; new support no longer clear
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