(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg - place place step)

  (:predicates
    ;; disk ?d is directly on place ?p (place is either a peg or a disk)
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
  ;; Advances the discrete stage by one successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      ;; disk is directly on its current support and is top
      (on ?d ?from)
      (clear ?d)
      ;; destination peg must be empty
      (clear ?to)
    )
    :effect (and
      ;; update physical placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; moved disk is top (nothing above it)
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk from any place onto another top disk.
  ;; Destination disk must be top and larger than the moving disk.
  ;; Advances the discrete stage by one successor.
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
      ;; update physical placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; moved disk is top (nothing above it)
      (clear ?d)

      ;; advance discrete stage
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)