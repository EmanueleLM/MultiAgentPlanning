(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place phase)

  (:predicates
    (on ?d - disk ?p - place)        ; ?d is directly on ?p (peg or disk)
    (clear ?p - place)              ; nothing is directly on ?p
    (smaller ?a - disk ?b - disk)   ; static size ordering: ?a is smaller than ?b
    (current-phase ?ph - phase)     ; exactly one phase is true in any reachable state
    (next ?p1 - phase ?p2 - phase)  ; static successor relation between phases
  )

  ;; Move a top disk onto an empty peg (destination peg must be empty)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (on ?d ?from)           ; ?d is directly on ?from
      (clear ?d)              ; ?d has nothing on top (top disk)
      (clear ?to)             ; destination peg is empty (no top disk)
      (current-phase ?p)
      (next ?p ?pnext)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Move a top disk onto another top disk (destination disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (on ?d ?from)           ; ?d is directly on ?from
      (clear ?d)              ; ?d has nothing on top (top disk)
      (clear ?to)             ; destination disk has nothing on top (top disk)
      (smaller ?d ?to)        ; cannot place larger on smaller
      (current-phase ?p)
      (next ?p ?pnext)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )
)