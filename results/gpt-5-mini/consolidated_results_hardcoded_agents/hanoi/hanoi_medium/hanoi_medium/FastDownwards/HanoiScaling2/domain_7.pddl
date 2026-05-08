(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is directly on top of disk s
    (on-disk ?d - disk ?s - disk)
    ;; disk d is directly on top of peg p
    (on-peg ?d - disk ?p - peg)
    ;; no disk is on top of disk d
    (clear-disk ?d - disk)
    ;; no disk is on top of peg p
    (clear-peg ?p - peg)
    ;; disk size ordering: d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation to enforce contiguous step progression
    (succ ?s - stage ?s2 - stage)
    ;; current stage/timepoint
    (current ?s - stage)
  )

  ;; Move a clear disk from a peg to another peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ;; destination peg no longer clear
      (not (clear-peg ?to))
      ;; the moved disk is top and thus clear (no disk on top of it)
      (clear-disk ?d)
      ;; the former support (peg) becomes clear (top exposed)
      (clear-peg ?from)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from a peg onto a larger clear disk.
  (:action move-peg-to-disk
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
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      ;; destination disk no longer clear (has ?d on top)
      (not (clear-disk ?to))
      ;; the moved disk is now top and thus clear
      (clear-disk ?d)
      ;; the former support (peg) becomes clear
      (clear-peg ?from)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from on top of a disk to a peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; the disk that was supporting ?d becomes clear
      (clear-disk ?from)
      ;; destination peg no longer clear
      (not (clear-peg ?to))
      ;; moved disk is top and thus clear
      (clear-disk ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from on top of a disk onto a larger clear disk.
  (:action move-disk-to-disk
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
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; the disk that was supporting ?d becomes clear
      (clear-disk ?from)
      ;; destination disk no longer clear
      (not (clear-disk ?to))
      ;; moved disk is top and thus clear
      (clear-disk ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)