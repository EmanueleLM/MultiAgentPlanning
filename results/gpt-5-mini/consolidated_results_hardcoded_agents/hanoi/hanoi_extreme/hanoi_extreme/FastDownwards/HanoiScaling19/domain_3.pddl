(define (domain hanoi-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (next ?s1 - stage ?s2 - stage)
    (at ?s - stage)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at ?t)
      (next ?t ?t2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?t)
      (next ?t ?t2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at ?t))
      (at ?t2)
    )
  )
)