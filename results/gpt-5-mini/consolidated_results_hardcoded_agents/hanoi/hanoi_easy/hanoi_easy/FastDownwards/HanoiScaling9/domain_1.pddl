(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place stage - object
  )

  (:predicates
    ;; disk directly on a place (place = peg or disk)
    (on ?d - disk ?x - place)
    ;; top ?d ?p : disk ?d is the top disk on peg ?p
    (top ?d - disk ?p - peg)
    ;; empty ?p : peg ?p has no disks
    (empty ?p - peg)
    ;; size ordering: ?d1 smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage/time predicates
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Move a top disk that currently sits directly on another disk (?below)
  ;; onto the top of another disk (?t) on the destination peg.
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; moved disk: remove old top and on relations
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
  (:action move-disk-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)
      (empty ?to)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; moved disk: remove old top and on relations
      (not (top ?d ?from))
      (not (on ?d ?below))

      ;; place disk on destination peg and make it the top there
      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; the disk that was under the moved disk becomes the new top on the source peg
      (top ?below ?from)
    )
  )

  ;; Move a top disk that currently sits directly on the source peg (?from)
  ;; onto the top of another disk (?t) on the destination peg.
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove old top and on relations for moved disk
      (not (top ?d ?from))
      (not (on ?d ?from))

      ;; place disk on destination disk and make it the top there
      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; source peg becomes empty because the moved disk had been directly on the peg
      (empty ?from)
    )
  )

  ;; Move a top disk that currently sits directly on the source peg (?from)
  ;; onto an empty destination peg.
  (:action move-disk-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove old top and on relations for moved disk
      (not (top ?d ?from))
      (not (on ?d ?from))

      ;; place disk on destination peg and make it the top there
      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; source peg becomes empty because the moved disk had been directly on the peg
      (empty ?from)
    )
  )
)