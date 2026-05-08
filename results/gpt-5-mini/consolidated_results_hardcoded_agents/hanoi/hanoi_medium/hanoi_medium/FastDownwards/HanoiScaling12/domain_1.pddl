(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg step)

  (:predicates
    ;; Disk placement predicates (immediate support only)
    (on-peg ?d - disk ?p - peg)    ; disk ?d is directly on top of peg ?p
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on top of disk ?under

    ;; Top/clear indicators
    (clear-disk ?d - disk)         ; no disk on top of ?d
    (clear-peg ?p - peg)           ; no disk on top of peg ?p (peg empty)

    ;; Size ordering
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 strictly smaller than ?d2

    ;; Discrete time / stage progression
    (time-now ?s - step)           ; current global stage
    (next ?s1 - step ?s2 - step)   ; successor relation between stages
  )

  ;; Move: peg -> peg (disk was directly on a peg, moved to empty peg)
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)           ; ?d is the top disk of its support
      (clear-peg ?to)           ; destination peg has no top disk
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)         ; source peg becomes empty (no top disk)
      (not (clear-peg ?to))     ; destination peg is no longer empty
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move: peg -> disk (disk on peg moved onto a smaller disk)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)          ; destination disk must be top
      (smaller ?d ?to)          ; cannot place larger onto smaller
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))    ; destination disk now has a disk on top
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move: disk -> peg (disk directly on another disk moved to empty peg)
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
      (clear-disk ?from)        ; the former supporting disk becomes clear (top)
      (not (clear-peg ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move: disk -> disk (disk directly on a disk moved onto another top disk)
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