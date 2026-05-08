(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    (on ?d - place ?s - place)       ; disk ?d is directly on support ?s (peg or disk)
    (clear ?p - place)               ; nothing on top of place ?p (peg or disk)
    (smaller ?d - place ?s - place)  ; ?d is smaller than ?s (allows placing ?d on ?s)
    (next ?a - step ?b - step)       ; ordering of discrete steps/stages
    (used ?s - step)                 ; step has been executed
    (first ?s - step)                ; marks the first step
    (is-disk ?p - place)             ; marks which place objects are disks
    (is-peg ?p - place)              ; marks which place objects are pegs
  )

  ;; Move executed at the first step (must use the step marked first)
  (:action move-first
    :parameters (?d - place ?from - place ?to - place ?st - step)
    :precondition (and
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)          ; ?d must be top of its stack
      (clear ?to)         ; destination must be clear (empty top)
      (smaller ?d ?to)    ; cannot place larger on smaller
      (first ?st)         ; this action uses the first step
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from)) ; remove old support relation
      (on ?d ?to)         ; new support relation
      (clear ?from)       ; the former support becomes clear
      (not (clear ?to))   ; destination is no longer clear
      (clear ?d)          ; moved disk is top at destination
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
      (next ?prev ?st)    ; step ordering: prev -> st
      (used ?prev)        ; previous step must have been executed
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