(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; disk ?d is directly on place ?p (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; nothing directly on top of this place (disk or peg)
    (clear ?p - place)
    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; current discrete stage
    (at-step ?s - step)
    ;; successor relation for stages
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      ;; disk is directly on its current support
      (on ?d ?from)
      ;; disk has nothing on top (it is the top disk)
      (clear ?d)
      ;; destination peg must be empty (no disk directly on it)
      (clear ?to)
    )
    :effect (and
      ;; remove from old support, place on new peg
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination peg is no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; moved disk remains clear (nothing placed on top of it)
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be clear and larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      ;; disk is directly on its current support and is top
      (on ?d ?from)
      (clear ?d)
      ;; destination disk is top (nothing on it)
      (clear ?to)
      ;; size ordering: moving disk must be smaller than destination disk
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk now has something on it; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; moved disk remains clear
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)