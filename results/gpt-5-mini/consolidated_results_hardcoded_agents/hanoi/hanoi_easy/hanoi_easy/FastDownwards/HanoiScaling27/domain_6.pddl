(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations
    (on-peg ?d - disk ?p - peg)        ;; ?d is directly on peg ?p
    (on-disk ?d - disk ?under - disk) ;; ?d is directly on top of ?under (a disk)

    ;; top/clear indicators
    (clear-disk ?d - disk)            ;; no disk on top of ?d (it is top of its stack)
    (clear-peg ?p - peg)              ;; peg ?p has no disks (empty)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)   ;; ?d1 is strictly smaller than ?d2

    ;; discrete-time staging
    (succ ?s1 - stage ?s2 - stage)    ;; successor relation between stages
    (now ?s - stage)                  ;; current stage marker
  )

  ;; Move a top disk that is directly on a source peg onto an empty destination peg.
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      ;; disk ?d is directly on source peg and is the top disk there
      (on-peg ?d ?from)
      (clear-disk ?d)
      ;; destination peg must be empty
      (clear-peg ?to)
    )
    :effect (and
      ;; relocate ?d from source peg to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes non-empty; source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains top
      (clear-disk ?d)

      ;; advance the stage marker exactly one step forward
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is directly on a source peg onto another top disk (?to). ?d must be smaller than ?to.
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)     ;; ?d is top on its peg
      (clear-disk ?to)    ;; destination disk has nothing on top
      (smaller ?d ?to)    ;; size constraint
    )
    :effect (and
      ;; remove from peg, place on top of destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk now has a disk on top (no longer clear)
      (not (clear-disk ?to))

      ;; source peg becomes empty (since ?d was directly on it)
      (clear-peg ?from)

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk (?from) onto an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; ?d is the top disk of its stack
      (clear-peg ?to)     ;; destination peg empty
    )
    :effect (and
      ;; remove ?d from on top of ?from and place on empty peg ?to
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes non-empty
      (not (clear-peg ?to))

      ;; the disk that was below ?d becomes the new top (clear)
      (clear-disk ?from)

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk (?from) onto another top disk (?to). ?d must be smaller than ?to.
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