(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is immediately on object ?x (peg or disk)
    (on ?d - disk ?x - object)
    ;; nothing is on top of object ?x (peg or disk)
    (clear ?x - object)
    ;; disk ?a is strictly smaller than disk ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination peg no longer clear (has top disk ?d)
      (not (clear ?to))
      ;; the object from which ?d was taken becomes clear
      (clear ?from)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      ;; cannot place larger onto smaller
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination disk now has something on top
      (not (clear ?to))
      ;; object (peg or disk) from which ?d was taken becomes clear
      (clear ?from)
    )
  )
)