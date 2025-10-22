(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is directly on place ?p (a place is either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place ?p has nothing directly on top of it
    (clear ?p - place)
    ;; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; move a top disk from any place onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; move a top disk from any place onto another top disk (must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)