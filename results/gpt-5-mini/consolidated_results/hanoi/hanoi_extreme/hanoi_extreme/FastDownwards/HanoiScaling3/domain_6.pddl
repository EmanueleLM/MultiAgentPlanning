(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)    ; disk directly on a peg (bottom-most disk of that peg's stack)
    (on-disk ?d - disk ?u - disk)  ; disk directly on another disk (immediately above)
    (clear-disk ?d - disk)         ; nothing on top of this disk (it is the top of its stack)
    (clear-peg ?p - peg)           ; peg has nothing on it
    (smaller ?d1 - disk ?d2 - disk); static size ordering: d1 is smaller than d2
    (current ?s - stage)           ; current stage/timepoint
    (next ?s1 - stage ?s2 - stage) ; successor relation between stages
  )

  ;; Move a disk that is the only disk on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; disk is top (and thus the only disk on that peg)
      (clear-peg ?to)    ; destination peg empty
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)       ; source peg becomes empty
      (not (clear-peg ?to))   ; destination peg no longer empty
      (clear-disk ?d)         ; moved disk is top of its new peg (idempotent if already true)
    )
  )

  ;; Move a disk that is the only disk on a peg onto another top disk (that must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; disk is top (and thus the only disk on that peg)
      (clear-disk ?to)   ; destination disk is top
      (smaller ?d ?to)   ; moved disk is smaller than destination disk
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)       ; source peg becomes empty
      (not (clear-disk ?to))  ; destination disk no longer top
      (clear-disk ?d)         ; moved disk becomes top
    )
  )

  ;; Move a top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ; d is top of its stack
      (clear-peg ?to)     ; destination peg empty
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)      ; the disk that was under becomes top
      (not (clear-peg ?to))   ; destination peg no longer empty
      (clear-disk ?d)         ; moved disk is top of new peg (idempotent)
    )
  )

  ;; Move a top disk that is on another disk onto another top disk (must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)     ; moved disk is top of its stack
      (clear-disk ?to)    ; destination disk is top
      (smaller ?d ?to)    ; moved disk smaller than destination
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)     ; disk under becomes top
      (not (clear-disk ?to)) ; destination disk no longer top
      (clear-disk ?d)        ; moved disk is top at destination (idempotent)
    )
  )
)