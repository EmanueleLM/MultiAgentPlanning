(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk is directly on another disk
    (on-disk ?d - disk ?under - disk)
    ;; disk is directly on a peg
    (on-peg ?d - disk ?peg - peg)
    ;; this disk has nothing on top of it (is top of its stack)
    (clear-disk ?d - disk)
    ;; this peg has nothing on top of it (is empty)
    (clear-peg ?p - peg)
    ;; static size ordering between disks: (smaller a b) means a is strictly smaller than b
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage successor relation and current stage marker
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; Move top disk from one peg to another peg (destination peg must be empty), advancing global stage.
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ;; ?d must be top on its source peg
      (clear-peg ?to)    ;; destination peg must be empty
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ;; update clear/top facts
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a peg onto a disk (destination disk must be top and larger), advancing stage.
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)      ;; ?d must be top on its source peg
      (clear-disk ?to)     ;; destination disk must be top of its stack
      (smaller ?d ?to)     ;; cannot place larger disk on smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      ;; update clear/top facts
      (not (clear-disk ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a disk onto an empty peg, advancing stage.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; ?d must be top of its stack
      (clear-peg ?to)     ;; destination peg must be empty
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; update clear/top facts
      (not (clear-peg ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from one disk onto another disk (destination must be top and larger), advancing stage.
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; ?d must be top of its stack
      (clear-disk ?to)    ;; destination disk must be top
      (smaller ?d ?to)    ;; cannot place larger disk on smaller
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; update clear/top facts
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )
)