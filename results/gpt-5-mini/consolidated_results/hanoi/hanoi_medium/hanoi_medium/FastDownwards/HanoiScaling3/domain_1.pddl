(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types disk base step - object

  :predicates
    ;; disk directly on support (support is a disk or a base)
    (on ?d - disk ?s - object)
    ;; nothing is directly on this object (disk or base)
    (clear ?o - object)
    ;; strict size ordering: disk smaller than disk or base
    (smaller ?d - disk ?o - object)
    ;; stage bookkeeping: whether a step has been used
    (used ?st - step)
    ;; successor relation between steps
    (next ?a - step ?b - step)
    ;; marks the first step
    (first ?st - step)
  )

  ;; Move action for the very first (initial) step
  (:action move-start
    :parameters (?d - disk ?from - object ?to - object ?st - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (first ?st)
      (not (used ?st))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removal, the support ?from becomes clear
      (clear ?from)
      ;; the object ?to is no longer clear because ?d sits on it
      (not (clear ?to))
      ;; mark this stage used
      (used ?st)
    )
  )

  ;; General move action for subsequent (non-first) steps; requires predecessor stage used
  (:action move-next
    :parameters (?d - disk ?from - object ?to - object ?prev - step ?st - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (next ?prev ?st)
      (used ?prev)
      (not (used ?st))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clears
      (clear ?from)
      (not (clear ?to))
      ;; mark this stage used
      (used ?st)
    )
  )
)