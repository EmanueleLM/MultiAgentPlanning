(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    (on ?d - place ?s - place)        ; disk ?d is directly on support ?s (disk or peg)
    (clear ?p - place)                ; nothing is on top of place ?p (peg or disk)
    (smaller ?d - place ?s - place)   ; ?d is smaller than ?s (permitted to place ?d on ?s)
    (next ?a - step ?b - step)        ; ordering: step a must precede step b
    (used ?s - step)                  ; step has been executed
    (first ?s - step)                 ; marks the initial step
    (is-disk ?p - place)              ; marks which place objects are disks
    (is-peg ?p - place)               ; marks which place objects are pegs
  )

  ;; Move using the designated first step (start of the contiguous step chain)
  (:action move-first
    :parameters (?d - place ?from - place ?to - place ?st - step)
    :precondition (and
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (first ?st)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (used ?st)
    )
  )

  ;; Generic move that requires the previous step to have been used (enforces contiguous step use)
  (:action move-next
    :parameters (?d - place ?from - place ?to - place ?prev - step ?st - step)
    :precondition (and
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (next ?prev ?st)
      (used ?prev)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (used ?st)
    )
  )
)