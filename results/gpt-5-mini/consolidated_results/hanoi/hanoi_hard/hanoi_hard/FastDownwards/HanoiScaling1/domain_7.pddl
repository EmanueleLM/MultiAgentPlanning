(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)      ; ?d is directly on disk ?s
    (on-peg  ?d - disk ?p - peg)       ; ?d is directly on peg ?p
    (clear-disk ?d - disk)             ; nothing on top of ?d
    (clear-peg ?p - peg)               ; peg ?p is empty (no on-peg relation)
    (current ?s - stage)               ; current stage/timepoint
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg-empty
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
      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a (clear) disk
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
      (not (clear-disk ?to))   ; destination disk no longer clear
      (clear-peg ?from)        ; source peg becomes empty
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg
  (:action move-disk-to-peg-empty
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
      (not (clear-peg ?to))
      (clear-disk ?from)   ; disk below becomes clear
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto a (clear) disk
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
      (not (clear-disk ?to))  ; destination disk no longer clear
      (clear-disk ?from)      ; disk below source becomes clear
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )
)