(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    (on ?d - obj ?s - obj)          ; ?d is directly on support ?s (disk or peg)
    (clear ?x - obj)                ; nothing directly on ?x
    (disk ?x - obj)                 ; classification: object is a disk
    (peg ?x - obj)                  ; classification: object is a peg
    (smaller ?d1 - obj ?d2 - obj)   ; static size ordering: ?d1 is smaller than ?d2
    (current ?s - step)             ; current stage
    (next ?s - step ?s2 - step)     ; successor relation between stages
    (different ?x - obj ?y - obj)   ; explicit inequality between objects (ordered)
  )

  ;; Move a top disk from any support (?from) onto an empty peg (?to)
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
      (clear ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any support (?from) onto another disk (?to), respecting size ordering
  (:action move-onto-disk
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)