(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)    ; disk is directly on a peg (bottom-most disk of that peg's stack)
    (on-disk ?d - disk ?u - disk)  ; disk is directly on another disk (immediately above)
    (clear-disk ?d - disk)         ; nothing on top of this disk (it is the top of its stack)
    (clear-peg ?p - peg)           ; peg has nothing on it
    (smaller ?d1 - disk ?d2 - disk); static size ordering: d1 is smaller than d2
    (current ?s - stage)           ; current stage/timepoint
    (next ?s1 - stage ?s2 - stage) ; successor relation between stages (contiguous progression)
  )

  ;; Move a top disk that is the only disk on its peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; disk is top (and thus the only disk on that peg)
      (clear-peg ?to)    ; destination peg empty
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)       ; source peg becomes empty
      (not (clear-peg ?to))   ; destination peg no longer empty
      (clear-disk ?d)         ; moved disk is top of its new peg
    )
  )

  ;; Move the top disk that is the only disk on its peg onto another top disk (destination disk must be larger)
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

  ;; Move a top disk that sits on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)    ; ?d is directly on ?under
      (clear-disk ?d)        ; ?d is top of its stack
      (clear-peg ?to)        ; destination peg empty
      (not (= ?to ?under))   ; destination peg different (under is a disk)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)
      (clear-disk ?under)      ; the disk that was under becomes top
      (not (clear-peg ?to))    ; destination peg no longer empty
      (clear-disk ?d)          ; moved disk is top of new peg
    )
  )

  ;; Move a top disk that sits on another disk onto another top disk (destination must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)    ; ?d is directly on ?under
      (clear-disk ?d)        ; moved disk is top of its stack
      (clear-disk ?to)       ; destination disk is top
      (smaller ?d ?to)       ; moved disk smaller than destination
      (not (= ?under ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?under))
      (on-disk ?d ?to)
      (clear-disk ?under)     ; disk under becomes top
      (not (clear-disk ?to))  ; destination disk no longer top
      (clear-disk ?d)         ; moved disk is top at destination
    )
  )
)