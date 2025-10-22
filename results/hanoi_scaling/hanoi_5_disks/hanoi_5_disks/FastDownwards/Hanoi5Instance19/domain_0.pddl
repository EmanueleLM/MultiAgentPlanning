(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)    ;; immediate support: disk on a disk or on a peg
    (clear ?x - object)          ;; no disk is on top of this object (disk or peg)
    (smaller ?a - disk ?b - disk) ;; size ordering: ?a is smaller than ?b
  )

  ;; Move a clear disk from any support (disk or peg) onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a clear disk from any support (disk or peg) onto an empty disk
  ;; Only allowed if the moving disk is smaller than the destination disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)