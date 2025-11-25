(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place phase)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing is directly on place ?p
    (smaller ?a - disk ?b - disk)   ; disk ?a is smaller than disk ?b (static)
    (current-phase ?ph - phase)     ; which phase/stage is currently active (exactly one true)
    (next ?p1 - phase ?p2 - phase)  ; allowed phase successor relation (static)
  )

  ;; Move a top disk from any place to a peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Move a top disk from any place to a disk (must be smaller than the disk below)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )
)