(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg stage)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk (support)
    (on-disk ?d - disk ?support - disk)

    ;; clear predicates indicate there is nothing on top of the peg/disk
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; explicit discrete stage control (single action per stage)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ;; static size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Actions (origin: mover)
  ;; Move top disk from a peg to another peg.
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)
      (clear-disk ?d)

      (clear-peg ?to)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update clear/top facts
      (not (clear-peg ?to))   ;; destination peg now occupied at top
      (clear-peg ?from)       ;; source peg becomes empty
      (clear-disk ?d)         ;; moved disk is top-most

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from a disk to a peg.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)
      (clear-disk ?d)

      (clear-peg ?to)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; update clear/top facts
      (not (clear-peg ?to))  ;; destination peg no longer clear
      (clear-disk ?from)     ;; former support disk is now top-clear
      (clear-disk ?d)        ;; moved disk is top-most

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from a peg onto a disk (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)
      (clear-disk ?d)

      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; update clear/top facts
      (not (clear-disk ?to)) ;; target disk now has a disk on top
      (clear-peg ?from)      ;; source peg becomes empty
      (clear-disk ?d)        ;; moved disk is top-most

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from a disk onto another disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)
      (clear-disk ?d)

      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; update clear/top facts
      (not (clear-disk ?to)) ;; target disk no longer clear
      (clear-disk ?from)     ;; former support disk is now top-clear
      (clear-disk ?d)        ;; moved disk is top-most

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

)