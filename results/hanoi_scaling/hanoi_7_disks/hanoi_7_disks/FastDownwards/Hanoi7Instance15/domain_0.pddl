(define (domain Tower_of_Hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)
  (:predicates
    (on ?d - disk ?s - object)    ; disk ?d is directly on object ?s (disk or peg)
    (clear ?o - object)          ; there is no disk on top of object ?o
    (smaller ?d1 - disk ?d2 - disk) ; static strict size ordering
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-empty
    :parameters (?d - disk ?s - object ?t - peg)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (not (= ?s ?t))
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
    )
  )

  ;; Move a top disk onto another disk (which must be the top disk on the target peg and larger)
  (:action move-to-disk
    :parameters (?d - disk ?s - object ?t - peg ?e - disk)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (not (= ?s ?t))
      (on ?e ?t)
      (clear ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?e))
    )
  )
)