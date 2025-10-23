(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)              ; nothing is on top of object ?x
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?below - object ?peg - peg)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?below)
    )
  )

  ;; Move a top disk onto another disk (target disk must be clear and larger).
  (:action move-to-disk
    :parameters (?d - disk ?below - object ?target - disk)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?target)
      (not (clear ?target))
      (clear ?below)
    )
  )
)