(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)

  (:predicates
    ;; disk is directly on object (either a disk or a peg)
    (on ?d - disk ?x - object)
    ;; nothing is on top of this object (object = disk or peg). For pegs, clear means empty.
    (clear ?x - object)
    ;; size ordering: (smaller x y) means disk x is strictly smaller than disk y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ;; peg is no longer empty / target is occupied
      (clear ?from)        ;; the previous support becomes clear (now has nothing directly on it)
    )
  )

  ;; Move a top disk onto another disk (target disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ;; target disk now has something on top
      (clear ?from)        ;; previous support becomes clear
    )
  )
)