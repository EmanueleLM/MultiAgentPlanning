(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ; disk placement: a disk is on a place (place = peg or disk)
    (on ?d - disk ?p - place)
    ; place is clear on top (no disk on top of it)
    (clear ?p - place)
    ; static ordering: first disk is smaller than second disk
    (smaller ?d1 - disk ?d2 - disk)
    ; sequencing control for the audited move plan
    (ready ?s - step)
    (done ?s - step)
    (succ ?s1 - step ?s2 - step)
    ; allowed move bindings derived from the mover's proposed sequence and audited
    ; mapping: either the target is a peg (empty peg at that step) ...
    (allowed-peg ?s - step ?d - disk ?from - place ?to - peg)
    ; ... or the target is a disk (placing onto the current top disk of a peg)
    (allowed-disk ?s - step ?d - disk ?from - place ?to - disk)
  )

  ; Move a top disk to an empty peg (explicit, audited)
  (:action mover-do-move-to-peg
    :parameters (?s - step ?succ - step ?d - disk ?from - place ?to - peg)
    :precondition (and
      (ready ?s)
      (allowed-peg ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (succ ?s ?succ)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ; Move a top disk onto a top disk (explicit, audited), enforces size ordering
  (:action mover-do-move-to-disk
    :parameters (?s - step ?succ - step ?d - disk ?from - place ?to - disk)
    :precondition (and
      (ready ?s)
      (allowed-disk ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (succ ?s ?succ)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )
)