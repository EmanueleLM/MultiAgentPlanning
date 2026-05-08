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

  ;; Move executed at the first step (must use the step marked first)
  (:action move-first
    :parameters (?d - place ?from - place ?to - place ?st - step)
    :precondition (and
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)           ; disk must be top of its stack
      (clear ?to)          ; destination top must be clear
      (smaller ?d ?to)     ; cannot place larger on smaller (includes peg supports)
      (first ?st)          ; use the first step
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; former support now has nothing on top
      (not (clear ?to))    ; destination support now has something on top
      (clear ?d)           ; the moved disk is top at destination
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
      (next ?prev ?st)     ; step ordering: prev -> st
      (used ?prev)         ; previous step must have been executed
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