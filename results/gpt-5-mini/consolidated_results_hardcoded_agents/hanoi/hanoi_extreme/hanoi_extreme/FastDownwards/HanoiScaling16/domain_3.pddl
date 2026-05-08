(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk is directly on a peg (bottom of a stack)
    (on-disk ?d - disk ?b - disk)    ; disk d is directly on disk b (b is immediately below d)
    (top ?d - disk)                  ; disk is the top disk of its stack (on a peg or on another disk)
    (empty ?p - peg)                 ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2 (size ordering)
    (next ?s1 - stage ?s2 - stage)   ; successor relation for stages (discrete time)
    (at-stage ?s - stage)            ; current stage marker (unique)
  )

  ;; Move a top disk that is currently on a peg to an empty peg.
  (:action move-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
      (not (at-stage ?s2))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update emptiness
      (not (empty ?to))
      (empty ?from)

      ;; top stays true for moved disk (it is top at the destination)
      (top ?d)
    )
  )

  ;; Move a top disk that is currently on a peg to be on top of another disk (target disk is top and larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (top ?v)
      (smaller ?d ?v)
      (not (at-stage ?s2))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove from source peg, place on disk v
      (not (on-peg ?d ?from))
      (on-disk ?d ?v)

      ;; source peg becomes empty (disk was the only disk on that peg)
      (empty ?from)

      ;; update top markers: v is no longer top, d becomes top
      (not (top ?v))
      (top ?d)
    )
  )

  ;; Move a top disk that is currently on another disk (above ?below) to an empty peg.
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (top ?d)
      (empty ?to)
      (not (at-stage ?s2))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove relation to disk below, place on empty peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; target peg now non-empty
      (not (empty ?to))

      ;; the disk below becomes the new top of its stack
      (top ?below)

      ;; moved disk remains top at its new location
      (top ?d)
    )
  )

  ;; Move a top disk that is currently on another disk (above ?below) onto another top disk ?v (which is larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (top ?d)
      (top ?v)
      (smaller ?d ?v)
      (not (at-stage ?s2))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; relocate d from above ?below to above ?v
      (not (on-disk ?d ?below))
      (on-disk ?d ?v)

      ;; update top markers: v is no longer top, below becomes top, d becomes top
      (not (top ?v))
      (top ?below)
      (top ?d)
    )
  )
)