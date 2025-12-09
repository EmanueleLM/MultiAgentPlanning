(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (i.e., bottom-most on that peg)
    (on-disk ?d - disk ?under - disk)  ; disk ?d is directly on top of disk ?under

    (clear-disk ?d - disk)             ; no disk directly on top of ?d (i.e., ?d is top of its stack)
    (clear-peg ?p - peg)               ; peg ?p has no disks (empty)

    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is strictly smaller than ?d2

    (time-now ?s - step)               ; current global stage
    (next ?s1 - step ?s2 - step)       ; successor relation between stages
  )

  ;; Move a top disk that sits directly on a peg to an empty peg.
  ;; Preconditions ensure the disk is top (clear-disk) and directly on the source peg.
  ;; The destination peg must be empty (clear-peg).
  ;; Time-step progression is enforced by requiring current time and a successor.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg onto a top disk on another peg.
  ;; Destination disk must be top and larger than the moving disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on another disk to an empty peg.
  ;; The supporting disk becomes top (clear-disk) after the move.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on another disk onto a top disk on another peg.
  ;; Destination disk must be top and larger than the moving disk.
  ;; The supporting disk becomes top (clear-disk) after the move.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)