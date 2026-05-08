(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; place ?p has nothing on top
    (smaller ?d1 - disk ?d2 - disk) ; disk d1 is smaller than disk d2
    (current ?s - stage)            ; current stage/time point
    (next ?s1 - stage ?s2 - stage)  ; successor relation between stages
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )
)