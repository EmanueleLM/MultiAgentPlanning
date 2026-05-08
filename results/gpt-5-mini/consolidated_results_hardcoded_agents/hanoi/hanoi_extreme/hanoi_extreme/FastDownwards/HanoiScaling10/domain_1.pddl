(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (current ?t - step)
    (next ?t1 - step ?t2 - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?peg - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
      (not (= ?from ?peg))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?target - disk ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (not (= ?from ?target))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (current ?t))
      (current ?t2)
    )
  )
)