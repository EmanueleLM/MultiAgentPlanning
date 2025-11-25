(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    peg disk stage
  )

  (:predicates
    ; disk directly on a peg
    (on-peg ?d - disk ?p - peg)

    ; disk directly on another disk
    (on-disk ?d - disk ?below - disk)

    ; top disk on a peg
    (top ?d - disk ?p - peg)

    ; peg is empty
    (empty ?p - peg)

    ; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ; stage control predicates to enforce ordered action progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ; Move a top disk that currently rests directly on a peg to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (empty ?p_to))
      (empty ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )

  ; Move a top disk that is directly on another disk to an empty peg.
  ; The disk below remains on the same peg, and becomes the new top there.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?p_to)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      ; the disk that supported the moved disk becomes the new top on the source peg
      (top ?below ?p_from)

      (not (empty ?p_to))

      (not (current ?s))
      (current ?ns)
    )
  )

  ; Move a top disk that is directly on a peg onto another top disk (destination peg has top disk ?t)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-disk ?d ?t)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (top ?t ?p_to))

      (empty ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )

  ; Move a top disk that is on another disk onto another top disk.
  ; The disk below the moved disk becomes the new top on the source peg.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      (not (top ?d ?p_from))
      (top ?d ?p_to)

      (not (top ?t ?p_to))

      ; the disk that supported the moved disk becomes the new top on the source peg
      (top ?below ?p_from)

      (not (current ?s))
      (current ?ns)
    )
  )
)