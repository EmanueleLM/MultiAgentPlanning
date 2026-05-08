(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  ;; types:
  ;; disk and peg are subtypes of place; place and step are subtypes of object
  (:types disk peg - place place step - object)

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

  ;; Move a top disk from any place onto an empty peg (destination must be a peg).
  ;; Enforces single-disk-at-a-time, top-disk-only, and advances the discrete stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      ;; disk is directly on its current support and is top
      (on ?d ?from)
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

      ;; moved disk remains the top (clear)
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk from any place onto another disk.
  ;; Destination disk must be top and larger than the moving disk.
  ;; Enforces size ordering, single-disk movement, top-disk-only, and advances the discrete stage.
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
      ;; size ordering: moving disk must be strictly smaller than destination disk
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk now has something on it; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; moved disk remains top (clear)
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)