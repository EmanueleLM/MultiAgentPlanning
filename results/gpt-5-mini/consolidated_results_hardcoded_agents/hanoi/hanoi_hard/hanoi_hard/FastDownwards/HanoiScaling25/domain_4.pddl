(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    (on ?d - disk ?p - object)    ; ?d is directly on object ?p (peg or disk)
    (clear ?p - object)           ; nothing directly on object ?p
    (smaller ?a - disk ?b - disk) ; ?a is strictly smaller than ?b
    (next ?s - stage ?s2 - stage) ; stage successor relation
    (at-stage ?s - stage)         ; current stage marker (exactly one holds)
  )

  ;; Move a top disk to an empty peg (destination must be a peg).
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk onto another (strictly larger) disk.
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)