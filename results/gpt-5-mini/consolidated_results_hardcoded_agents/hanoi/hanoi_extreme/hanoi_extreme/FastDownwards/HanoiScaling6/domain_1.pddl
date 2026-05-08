(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step place - object)
  ;; note: 'place' is a supertype for pegs and disks; using object typing for compatibility
  (:predicates
    ;; a disk is directly on a place (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; nothing on top of this place (place can be a disk or a peg)
    (clear ?p - place)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; current discrete stage
    (current ?s - step)
    ;; immediate successor relation between stages (static)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a single top disk onto an empty peg (peg must be clear), advancing the current step to its successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a single top disk onto another larger disk (target disk must be clear and larger), advancing the current step.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?s))
      (current ?s2)
    )
  )
)