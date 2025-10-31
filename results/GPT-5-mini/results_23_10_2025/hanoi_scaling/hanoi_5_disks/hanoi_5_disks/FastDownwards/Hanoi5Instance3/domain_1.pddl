(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are also places where something can be on
  (:predicates
    ;; disk ?d is directly on place ?p (place is either a peg or a disk)
    (on ?d - disk ?p - place)
    ;; place ?p has nothing directly on it
    (clear ?p - place)
    ;; disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a clear disk from any place onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a clear disk from any place onto a top disk (the disk on target must be larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)