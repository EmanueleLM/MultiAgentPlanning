(define (domain hanoi2agents_staged)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
    lightdisk - disk
    heavydisk - disk
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-a1-to-peg
    :parameters (?d - lightdisk ?from - support ?to - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (at ?t1))
      (at ?t2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-a1-to-disk
    :parameters (?d - lightdisk ?from - support ?to - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (at ?t1))
      (at ?t2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-a2-to-peg
    :parameters (?d - heavydisk ?from - support ?to - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (at ?t1))
      (at ?t2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-a2-to-disk
    :parameters (?d - heavydisk ?from - support ?to - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (at ?t1))
      (at ?t2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)