(define (domain hanoi7-instance14)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)  ; disk and peg are subtypes of object

  (:predicates
    ;; disk ?d is directly on entity ?x (entity is either a disk or a peg)
    (on ?d - disk ?x - object)
    ;; no disk is directly on entity ?x (entity is disk or peg)
    (clear ?x - object)
    ;; disk ?d1 is smaller than disk ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk onto an empty peg (peg must be clear; disk must be clear; disk must currently be on some entity)
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
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move a disk onto another disk (destination disk must be larger than moving disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)