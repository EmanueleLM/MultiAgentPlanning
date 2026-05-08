(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg level step)

  (:predicates
    (at ?d - disk ?p - peg ?l - level)       ; disk ?d at peg ?p at level ?l (level counts from 0 = empty up)
    (height ?p - peg ?l - level)             ; current top level (occupied) of peg ?p is ?l
    (succ ?l1 - level ?l2 - level)           ; successor relation on levels: ?l2 = ?l1 + 1
    (enabled ?s - step)                      ; step ?s is the currently enabled step
    (step-next ?s1 - step ?s2 - step)        ; ordering: ?s2 follows ?s1
    (last-step ?s - step)                    ; marks the final step
    (larger ?x - disk ?y - disk)             ; disk ?x is larger than disk ?y
  )

  ;; Move top disk from a non-empty source peg to an empty target peg, advance to next step.
  (:action move-to-empty-next
    :parameters (?s - step ?d - disk ?from - peg ?to - peg
                 ?lfrom - level ?lfrom_prev - level ?lto - level ?next - step)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)        ; level directly below ?d
      (height ?from ?lfrom)            ; ?d is top of source peg
      (height ?to lvl0)                ; target currently empty (the canonical lvl0 object)
      (succ lvl0 ?lto)                 ; placing will occupy level ?lto
      (step-next ?s ?next)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to lvl0))
      (height ?to ?lto)
      (not (enabled ?s))
      (enabled ?next)
    )
  )

  ;; Move top disk from a non-empty source peg to an empty target peg, final step (no next).
  (:action move-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg
                 ?lfrom - level ?lfrom_prev - level ?lto - level)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to lvl0)
      (succ lvl0 ?lto)
      (last-step ?s)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to lvl0))
      (height ?to ?lto)
      (not (enabled ?s))
    )
  )

  ;; Move top disk from a non-empty source peg onto a non-empty target peg, advance to next step.
  (:action move-onto-disk-next
    :parameters (?s - step ?d - disk ?from - peg ?to - peg
                 ?lfrom - level ?lfrom_prev - level ?lto_prev - level ?lto - level
                 ?below - disk ?next - step)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to ?lto_prev)            ; target non-empty, top at ?lto_prev
      (succ ?lto_prev ?lto)              ; new target level after placing ?d
      (at ?below ?to ?lto_prev)          ; ?below is current top disk on ?to
      (larger ?below ?d)                 ; size constraint: below larger than d
      (step-next ?s ?next)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to ?lto_prev))
      (height ?to ?lto)
      (not (enabled ?s))
      (enabled ?next)
    )
  )

  ;; Move top disk from a non-empty source peg onto a non-empty target peg, final step.
  (:action move-onto-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg
                 ?lfrom - level ?lfrom_prev - level ?lto_prev - level ?lto - level
                 ?below - disk)
    :precondition (and
      (enabled ?s)
      (at ?d ?from ?lfrom)
      (succ ?lfrom_prev ?lfrom)
      (height ?from ?lfrom)
      (height ?to ?lto_prev)
      (succ ?lto_prev ?lto)
      (at ?below ?to ?lto_prev)
      (larger ?below ?d)
      (last-step ?s)
    )
    :effect (and
      (not (at ?d ?from ?lfrom))
      (at ?d ?to ?lto)
      (not (height ?from ?lfrom))
      (height ?from ?lfrom_prev)
      (not (height ?to ?lto_prev))
      (height ?to ?lto)
      (not (enabled ?s))
    )
  )
)