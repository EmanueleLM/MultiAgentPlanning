(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; on ?d ?x means disk ?d is directly on object ?x (where ?x is either a peg or another disk)
    (on ?d - disk ?x - object)
    ;; top ?d ?p means disk ?d is the top disk on peg ?p
    (top ?d - disk ?p - peg)
    ;; empty ?p means peg ?p has no disks
    (empty ?p - peg)
    ;; smaller ?d1 ?d2 means disk ?d1 is strictly smaller than disk ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that currently sits directly on another disk (?below)
  ;; onto the top of another disk (?t) on the destination peg.
  (:action move-with-below-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; remove old top and on relations for moved disk
      (not (top ?d ?from))
      (not (on ?d ?below))
      ;; place disk on destination disk and make it the top there
      (on ?d ?t)
      (top ?d ?to)
      ;; the disk that was the previous top on destination is no longer top
      (not (top ?t ?to))
      ;; the disk that was under the moved disk becomes the new top on the source peg
      (top ?below ?from)
    )
  )

  ;; Move a top disk that currently sits directly on another disk (?below)
  ;; onto an empty destination peg.
  (:action move-with-below-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on ?d ?below))
      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      ;; the disk that was under the moved disk becomes the new top on the source peg
      (top ?below ?from)
    )
  )

  ;; Move a top disk that currently sits directly on the source peg (?from)
  ;; onto the top of another disk (?t) on the destination peg.
  (:action move-on-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on ?d ?from))
      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))
      ;; source peg becomes empty because the moved disk had been directly on the peg
      (empty ?from)
    )
  )

  ;; Move a top disk that currently sits directly on the source peg (?from)
  ;; onto an empty destination peg.
  (:action move-on-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on ?d ?from))
      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      ;; source peg becomes empty
      (empty ?from)
    )
  )
)