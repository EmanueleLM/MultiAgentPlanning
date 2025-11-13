(define (domain hanoi3agents_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    peg disk - support
  )
  (:predicates
    ; agent capabilities
    (can-move ?a - agent ?d - disk)

    ; strict total order on disks: smaller x y means x < y
    (smaller ?x - disk ?y - disk)

    ; stacking relations
    (on ?d - disk ?s - support)
    (clear ?s - support)

    ; discrete ordered stages
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ; move a disk to an empty peg
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (at ?t1))
      (at ?t2)
    )
  )

  ; move a disk onto the top of another disk
  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (can-move ?ag ?d)
      (at ?t1)
      (next ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (at ?t1))
      (at ?t2)
    )
  )
)