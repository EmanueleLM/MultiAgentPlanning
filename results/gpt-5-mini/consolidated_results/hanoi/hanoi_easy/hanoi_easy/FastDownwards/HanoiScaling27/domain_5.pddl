(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk location relations
    (on-disk ?d - disk ?under - disk)    ;; ?d is directly on top of ?under
    (on-peg ?d - disk ?peg - peg)        ;; ?d is directly on a peg

    ;; top/clear indicators
    (clear-disk ?d - disk)               ;; there is no disk on top of ?d (it is a top piece)
    (clear-peg ?p - peg)                 ;; peg has no disks (empty)

    ;; static size ordering: true iff ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete-time staging
    (succ ?s1 - stage ?s2 - stage)       ;; successor relation between stages
    (now ?s - stage)                     ;; current stage marker
  )

  ;; Move top disk from a peg onto an empty peg (advances stage).
  ;; Preconditions ensure the disk is the top disk on the source peg and the destination peg is empty.
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; relocate disk ?d from source peg to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes non-empty; source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains a top disk (no disk on top of it)
      (clear-disk ?d)

      ;; advance the stage marker exactly one step forward
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a peg onto a top disk (destination disk must be larger), advancing stage.
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)     ;; ?d is top on its peg
      (clear-disk ?to)    ;; destination disk has nothing on top
      (smaller ?d ?to)    ;; can only place smaller on larger
    )
    :effect (and
      ;; remove from peg, place on top of destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk now has a disk on top (no longer clear)
      (not (clear-disk ?to))

      ;; source peg may now be empty
      (clear-peg ?from)

      ;; moved disk remains top
      (clear-disk ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from on top of a disk onto an empty peg, advancing stage.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; ?d is top on its stack
      (clear-peg ?to)     ;; destination peg empty
    )
    :effect (and
      ;; relocate disk ?d from atop ?from onto empty peg ?to
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes non-empty; the disk that was below ?d becomes top
      (not (clear-peg ?to))
      (clear-disk ?from)

      ;; moved disk remains top
      (clear-disk ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from on top of a disk onto another top disk (destination disk must be larger), advancing stage.
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; ?d is top on its stack
      (clear-disk ?to)    ;; destination disk has no disk on top
      (smaller ?d ?to)    ;; size constraint: cannot place larger on smaller
    )
    :effect (and
      ;; move ?d from atop ?from onto ?to
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk becomes not clear; the disk that was below ?d becomes clear
      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; moved disk remains top
      (clear-disk ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )
)