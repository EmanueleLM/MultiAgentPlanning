(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p (directly touching peg)
    (on-disk ?d - disk ?below - disk)  ; ?d is directly on top of disk ?below
    (top ?d - disk)                    ; ?d has no disk on top of it (it is movable)
    (empty ?p - peg)                   ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2
    (next ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor stage of s1
    (at-stage ?s - stage)              ; current global stage is ?s
  )

  ;; Move a top disk that is directly on a peg to an empty peg (source and destination pegs must differ).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (destination disk must be strictly larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (empty ?from)
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?d ?below))
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?below)
      (not (empty ?to))
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (destination disk must be strictly larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?frombelow - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?frombelow)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (not (= ?d ?to))
      (not (= ?frombelow ?to))
    )
    :effect (and
      (not (on-disk ?d ?frombelow))
      (on-disk ?d ?to)
      (top ?frombelow)
      (not (top ?to))
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)