(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; Disk placement: direct support relations
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?under - disk)  ; disk ?d is directly on disk ?under

    ;; Top/clear indicators
    (clear-disk ?d - disk)             ; no disk directly on top of ?d
    (clear-peg ?p - peg)               ; peg ?p has no disks (empty)

    ;; Size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; Discrete stage progression
    (time-now ?s - step)               ; current global stage
    (next ?s1 - step ?s2 - step)       ; successor relation between stages
  )

  ;; Move: disk that is directly on a peg -> move to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)           ; ?d must be the top disk of its support
      (clear-peg ?to)           ; destination peg must be empty
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)         ; source peg becomes empty (since ?d was top & directly on peg)
      (not (clear-peg ?to))     ; destination peg no longer empty
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move: disk that is directly on a peg -> onto a top disk on another peg
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

  ;; Move: disk that is directly on another disk -> to an empty peg
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
      (clear-disk ?from)        ; supporting disk becomes top (clear)
      (not (clear-peg ?to))
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move: disk that is directly on another disk -> onto a top disk
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