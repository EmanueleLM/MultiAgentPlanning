(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; classification
    (disk ?x - obj)
    (peg  ?x - obj)

    ;; direct support relation: disk ?d is directly on object ?p (disk or peg)
    (on ?d - obj ?p - obj)

    ;; nothing directly on top of the object (peg or disk)
    (clear ?x - obj)

    ;; placement legality: disk ?d may be placed onto object ?p
    (allowed ?d - obj ?p - obj)

    ;; discrete global stage marker and immediate successor relation
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move exactly one top disk to a currently-clear allowed destination,
  ;; advancing the global stage by exactly one successor.
  (:action move
    :parameters (?d - obj ?from - obj ?to - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/topness:
      ;; destination now has something on top (not clear)
      (not (clear ?to))
      ;; the former support becomes clear (the disk on it was removed)
      (clear ?from)
      ;; the moved disk has nothing on top after the move
      (clear ?d)

      ;; advance discrete stage marker exactly one step
      (not (current ?s))
      (current ?s2)
    )
  )
)