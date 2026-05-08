(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)     ; disk is directly on a peg (bottom-most of that peg if there are others above)
    (on-disk ?d - disk ?below - disk) ; disk is directly on another disk
    (top ?d - disk)                 ; no disk on top of this disk (it is movable)
    (empty ?p - peg)                ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2
    (next ?s1 - stage ?s2 - stage)  ; s2 is the successor of s1
    (at-stage ?s - stage)           ; current global stage
  )

  ;; Move a top disk that sits directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg onto another top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (empty ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?below)
      (not (empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?frombelow - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?frombelow)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?frombelow))
      (on-disk ?d ?to)
      (top ?frombelow)
      (not (top ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)