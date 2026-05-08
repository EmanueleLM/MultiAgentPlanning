(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)        ; disk d is on peg p
    (top ?p - peg ?d - disk)      ; d is the top disk on peg p
    (bottom ?p - peg ?d - disk)   ; d is the bottom disk on peg p (peg has at least one disk)
    (above ?d - disk ?below - disk) ; d is directly above below on the same peg
    (empty ?p - peg)              ; peg has no disks
    (larger ?x - disk ?y - disk)  ; x is larger than y (static)
    (step-current ?s - step)      ; current stage
    (next ?s1 - step ?s2 - step)  ; successor relation between stages
  )

  ;; Move a top disk that has another disk below it onto a non-empty peg's top disk
  (:action move-with-below-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)

      ;; source conditions
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)

      ;; destination conditions
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      ;; update on-location
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update source peg top: below becomes new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; remove adjacency at source
      (not (above ?d ?below))

      ;; update destination peg top and adjacency
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)

      ;; peg occupancy flags
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move a top disk that has another disk below it onto an empty peg
  (:action move-with-below-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)

      ;; source
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)

      ;; destination empty
      (empty ?to)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update source top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; remove adjacency at source
      (not (above ?d ?below))

      ;; destination now has single disk d (top and bottom)
      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move a single disk (it is both top and bottom on its peg) onto a non-empty peg top disk
  (:action move-only-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)

      ;; source is single disk
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)

      ;; destination non-empty with top t larger than d
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes empty
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)

      ;; destination top and adjacency updated
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)

      ;; destination is not empty (redundant but explicit)
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move a single disk (both top and bottom) onto an empty peg
  (:action move-only-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)

      ;; source is single disk
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)

      ;; destination empty
      (empty ?to)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes empty
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)

      ;; destination becomes single disk (top & bottom)
      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )
)