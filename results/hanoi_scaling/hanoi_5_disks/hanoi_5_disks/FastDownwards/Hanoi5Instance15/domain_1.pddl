(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)      ; disk ?d is directly on top of object ?x (peg or disk)
    (clear ?x - object)            ; object ?x (peg or disk) has nothing on top
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is smaller than ?d2
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?src - object ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )

  ;; Move a top disk onto another disk (only if smaller)
  (:action move-to-disk
    :parameters (?d - disk ?src - object ?dst - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )
)