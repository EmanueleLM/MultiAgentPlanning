(define (domain hanoi2agents_staged)
  (:requirements :strips :typing :negative-preconditions)
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
    (atstage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action a1-move-to-peg
    :parameters (?d - lightdisk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (atstage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (atstage ?s))
      (atstage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action a1-move-to-disk
    :parameters (?d - lightdisk ?from - support ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (atstage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (atstage ?s))
      (atstage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action a2-move-to-peg
    :parameters (?d - heavydisk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (atstage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (atstage ?s))
      (atstage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action a2-move-to-disk
    :parameters (?d - heavydisk ?from - support ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (atstage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (atstage ?s))
      (atstage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)