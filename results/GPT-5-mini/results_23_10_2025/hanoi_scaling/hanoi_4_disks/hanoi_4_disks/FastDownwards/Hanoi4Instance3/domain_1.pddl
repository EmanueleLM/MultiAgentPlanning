(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    ;; disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing directly on top of it
    (clear ?p - place)
    ;; size ordering: (smaller x y) means x is smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)      ;; ?d is directly on ?from
      (clear ?d)         ;; ?d is the top disk on its stack
      (clear ?to)        ;; target peg is empty at top
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the source place becomes clear on top after removing ?d
      (not (clear ?to))  ;; target peg is no longer clear (now has ?d on top)
    )
  )

  ;; Move a top disk onto another disk (only if moved disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)      ;; ?d is directly on ?from
      (clear ?d)         ;; ?d is the top disk on its stack
      (clear ?to)        ;; ?to disk has nothing on top (so ?d will be placed on it)
      (smaller ?d ?to)   ;; cannot place larger disk on smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the source place becomes clear on top after removing ?d
      (not (clear ?to))  ;; target disk is no longer clear (now has ?d on top)
    )
  )
)