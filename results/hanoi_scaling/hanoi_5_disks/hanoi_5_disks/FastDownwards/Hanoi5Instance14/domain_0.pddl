; PDDL domain for Tower of Hanoi (Fast Downwards compatible)
; Assumptions documented in the problem file. This domain encodes:
; - disks and pegs are all treated as objects of a single type "place"
; - disk objects are marked with (disk ?x) and pegs with (peg ?x)
; - a disk can be directly on a peg or on another disk via (on ?disk ?place)
; - (clear ?x) means there is no disk directly on top of ?x
; - (smaller ?d1 ?d2) is a strict size ordering: d1 is strictly smaller than d2
(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:types place)

  (:predicates
    (disk ?p - place)       ; marks which objects are disks
    (peg ?p - place)        ; marks which objects are pegs
    (on ?d - place ?p - place)    ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)      ; nothing is on top of ?p (peg or disk)
    (smaller ?d1 - place ?d2 - place) ; d1 is strictly smaller than d2
  )

  ; Move a clear disk from its current support to an empty peg (target is a peg that is clear).
  (:action move-to-empty-peg
    :parameters (?d - place ?from - place ?to - place)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a clear disk from its current support to be on top of another clear disk,
  ; only if the moving disk is smaller than the target disk.
  (:action move-onto-disk
    :parameters (?d - place ?from - place ?t - place ?tbase - place)
    :precondition (and
      (disk ?d)
      (disk ?t)
      (on ?d ?from)        ; ?d is directly supported by ?from (peg or disk)
      (on ?t ?tbase)       ; ?t is directly supported by ?tbase (peg or disk)
      (clear ?d)
      (clear ?t)           ; ?t is the top disk of its stack
      (smaller ?d ?t)      ; enforce no larger disk on smaller disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)