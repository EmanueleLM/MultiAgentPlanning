(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)               ; nothing on top of place ?p
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is strictly smaller than d2
    (at-step ?s - step)              ; current plan step marker
    (next ?s1 - step ?s2 - step)     ; successor relation for steps
  )

  ;; Move top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)            ; disk ?d is top of its stack
      (clear ?to)           ; destination peg is empty on top
      (at-step ?cur)
      (next ?cur ?next)
      (not (on ?d ?to))     ; prevent no-op move onto same support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )

  ;; Move top disk onto another disk (enforce size ordering)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)      ; only allow if moving disk is smaller than destination disk
      (at-step ?cur)
      (next ?cur ?next)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )
)