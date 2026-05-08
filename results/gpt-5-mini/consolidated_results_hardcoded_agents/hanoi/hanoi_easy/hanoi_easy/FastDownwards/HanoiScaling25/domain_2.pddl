(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; classification of objects
    (disk ?x - obj)
    (peg  ?x - obj)

    ;; direct support relation: disk ?d is directly on object ?p (disk or peg)
    (on ?d - obj ?p - obj)

    ;; nothing directly on top of the object (peg or disk)
    (clear ?x - obj)

    ;; precomputed placement legality: disk ?d may be placed onto object ?p
    (allowed ?d - obj ?p - obj)

    ;; discrete global stage marker and immediate successor relation
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Single-atom move advancing the global stage by exactly one successor step.
  ;; The move takes the top disk (?d) from its direct support (?from) to a destination (?to)
  ;; that must be currently clear and allowed for that disk.
  ;; Disallow trivial moves (?from = ?to).
  (:action move
    :parameters (?d - obj ?from - obj ?to - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
      (not (= ?from ?to))
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