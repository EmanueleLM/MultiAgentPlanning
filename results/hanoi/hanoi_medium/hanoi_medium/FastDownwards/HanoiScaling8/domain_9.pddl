(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)           ; disk d is on peg p
    (top ?p - peg ?d - disk)         ; d is the top disk on peg p
    (bottom ?p - peg ?d - disk)      ; d is the bottom disk on peg p (peg has at least one disk)
    (above ?d - disk ?below - disk)  ; d is directly above below on the same peg
    (empty ?p - peg)                 ; peg has no disks
    (larger ?x - disk ?y - disk)     ; x is larger than y (static)
    (step-current ?s - step)         ; current stage
    (next ?s1 - step ?s2 - step)     ; successor relation between stages
  )

  ;; Move a top disk that has another disk directly below it onto a non-empty peg's top disk
  (:action move-with-below-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)

      ;; disk on source and is top with a direct below neighbor
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)

      ;; destination non-empty with top t larger than d
      (on ?t ?to)
      (top ?to ?t)
      (larger ?t ?d)

      ;; disallow trivial no-op
      (not (on ?d ?to))
      (not (empty ?to))
    )
    :effect (and
      ;; move disk location
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update source top: below becomes new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; remove adjacency at source
      (not (above ?d ?below))

      ;; update destination top and adjacency
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)

      ;; ensure destination not marked empty
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

      ;; source has d with a direct below
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)

      ;; destination empty
      (empty ?to)

      ;; disallow trivial no-op
      (not (on ?d ?to))
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update source top to below
      (not (top ?from ?d))
      (top ?from ?below)

      ;; remove adjacency at source
      (not (above ?d ?below))

      ;; destination now single disk d (top and bottom)
      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move a disk that is both top and bottom (only disk on its peg) onto a non-empty peg top disk
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
      (on ?t ?to)
      (top ?to ?t)
      (larger ?t ?d)

      ;; disallow trivial no-op
      (not (on ?d ?to))
      (not (empty ?to))
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

      ;; destination not empty
      (not (empty ?to))

      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move a disk that is both top and bottom onto an empty peg
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

      ;; disallow trivial no-op
      (not (on ?d ?to))
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