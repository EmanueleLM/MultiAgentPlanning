(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    (on ?d - place ?p - place)     ; d is directly on p (p is a peg or a disk)
    (clear ?p - place)             ; nothing on top of p
    (smaller ?d - place ?p - place); d is smaller than p (allows placing d on p)
    (next ?a - step ?b - step)     ; step ordering
    (used ?s - step)               ; step has been used (an action executed at that stage)
    (first ?s - step)              ; first step marker
    (is-disk ?p - place)           ; marks which place objects are disks
    (is-peg ?p - place)            ; marks which place objects are pegs
  )

  ;; Move at the first step (uses the step marked as first)
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
      (used ?st)
    )
  )

  ;; Generic move that requires the previous step to have been used
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
      (used ?st)
    )
  )
)