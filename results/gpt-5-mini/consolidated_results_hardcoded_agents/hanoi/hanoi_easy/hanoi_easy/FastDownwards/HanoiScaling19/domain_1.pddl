(define (domain tower-of-hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; positional relations
    (on-peg ?d - disk ?p - peg)    ; disk ?d is directly on peg ?p (i.e., bottom-most disk at that peg or peg is support)
    (on-disk ?d - disk ?d2 - disk) ; disk ?d is directly on top of disk ?d2

    ;; clear flags indicate there is nothing on top of the object
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete time / stage modeling
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; positional update
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; clear flags: destination peg no longer clear, source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; advance time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a peg to the top of another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?toD - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?toD)
      (smaller ?d ?toD)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?toD)

      ;; destination disk no longer clear; source peg becomes clear
      (not (clear-disk ?toD))
      (clear-peg ?from)

      ;; advance time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?fromD - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?fromD)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?fromD))
      (on-peg ?d ?to)

      ;; support disk becomes clear, destination peg no longer clear
      (clear-disk ?fromD)
      (not (clear-peg ?to))

      ;; advance time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk to on top of another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?fromD - disk ?toD - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?fromD)
      (clear-disk ?d)
      (clear-disk ?toD)
      (smaller ?d ?toD)
    )
    :effect (and
      (not (on-disk ?d ?fromD))
      (on-disk ?d ?toD)

      ;; support disk becomes clear, destination disk no longer clear
      (clear-disk ?fromD)
      (not (clear-disk ?toD))

      ;; advance time
      (not (current ?s))
      (current ?s2)
    )
  )
)