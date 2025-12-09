(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - support
    stage
  )

  (:predicates
    (on ?d - disk ?s - support)         ; immediate support: disk ?d directly on support ?s (disk or peg)
    (clear ?s - support)               ; nothing is directly on support ?s (peg or disk)
    (smaller ?a - disk ?b - disk)      ; static size ordering: ?a is smaller than ?b
    (succ ?t1 - stage ?t2 - stage)     ; stage successor relation
    (current ?t - stage)               ; current stage at which exactly one move may occur
  )

  ; Move: immediate-support is a peg -> destination is a peg (destination peg empty)
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ; Move: immediate-support is a disk -> destination is a peg (destination peg empty)
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?s - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (= ?s ?to))
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?to)
      (clear ?s)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ; Move: immediate-support is a peg -> destination is a disk (destination disk must be top and larger)
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?d2 - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
      (current ?t)
      (succ ?t ?t2)
      (not (= ?from ?d2))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (clear ?from)
      (not (clear ?d2))
      (not (current ?t))
      (current ?t2)
    )
  )

  ; Move: immediate-support is a disk -> destination is a disk (destination disk must be top and larger)
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?s - disk ?d2 - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
      (current ?t)
      (succ ?t ?t2)
      (not (= ?s ?d2))
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?d2)
      (clear ?s)
      (not (clear ?d2))
      (not (current ?t))
      (current ?t2)
    )
  )
)