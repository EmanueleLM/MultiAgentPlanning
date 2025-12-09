(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)    ; ?d is directly on top of disk ?s
    (on-peg  ?d - disk ?p - peg)     ; ?d is directly on top of peg ?p
    (clear-disk ?d - disk)           ; no disk is on top of disk ?d (i.e., ?d is top of its stack)
    (clear-peg  ?p - peg)            ; peg ?p is empty (no disk directly on it)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2
    (succ ?s - stage ?s2 - stage)    ; successor relation over stages
    (current ?s - stage)             ; current stage/timepoint
  )

  ;; Move a top disk that is directly on a peg to an empty destination peg.
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
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a larger clear disk.
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
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
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
      (clear-disk ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto a larger clear disk.
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
      (clear-disk ?from)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)