(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)    ; ?d is directly on top of disk ?s
    (on-peg  ?d - disk ?p - peg)     ; ?d is directly on top of peg ?p (i.e., bottommost disk)
    (clear-disk ?d - disk)           ; no disk is on top of disk ?d (i.e., ?d is top of its stack)
    (clear-peg  ?p - peg)            ; peg ?p is empty (no disk directly on it)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2
    (succ ?s - stage ?s2 - stage)    ; successor relation over stages
    (current ?s - stage)             ; current stage/timepoint
  )

  ;; Move a disk that is directly on a peg (i.e., the only disk on that peg)
  ;; to an empty destination peg.
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
      (not (clear-peg ?to))        ; destination no longer empty
      (clear-disk ?d)              ; moved disk remains top
      (clear-peg ?from)            ; source peg becomes empty (was sole disk)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto a larger clear disk.
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
      (not (clear-disk ?to))      ; destination disk now has a disk on top
      (clear-disk ?d)             ; moved disk is top
      (clear-peg ?from)           ; source peg becomes empty (was sole disk)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
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
      (clear-disk ?from)          ; the supporting disk ?from becomes top
      (not (clear-peg ?to))       ; destination peg no longer empty
      (clear-disk ?d)             ; moved disk is top
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk onto a larger clear disk.
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
      (clear-disk ?from)          ; supporting disk becomes top
      (not (clear-disk ?to))      ; destination disk now has a disk on top
      (clear-disk ?d)             ; moved disk is top
      (not (current ?s))
      (current ?s2)
    )
  )
)