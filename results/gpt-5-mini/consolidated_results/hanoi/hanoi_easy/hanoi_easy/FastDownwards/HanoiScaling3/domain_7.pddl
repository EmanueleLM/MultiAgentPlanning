(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - support ?tod - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?tod)
      (smaller ?d ?tod)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tod)
      (clear ?from)
      (not (clear ?tod))
      (clear ?d)
      (not (current ?t))
      (current ?t2)
    )
  )
)