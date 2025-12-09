(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)    ; ?d is directly on place ?p (peg or disk)
    (clear ?p - place)           ; nothing directly on place ?p
    (smaller ?a - disk ?b - disk); ?a is strictly smaller than ?b
    (next ?s - stage ?s2 - stage); stage successor relation
    (at-stage ?s - stage)        ; current stage marker
  )

  ;; Move a top disk to an empty peg (destination peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
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

  ;; Move a top disk onto another (larger) disk.
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (at-stage ?s)
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