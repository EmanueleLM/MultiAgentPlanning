(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  ;; types: disk and peg are both kinds of place; stages enumerate discrete time steps
  (:types
    place stage
  )
  (:types
    disk peg - place
  )

  (:predicates
    ;; disk directly on a place (peg or disk)
    (on ?d - disk ?p - place)

    ;; top-clear: there is nothing on top of ?p (peg or disk)
    (clear ?p - place)

    ;; explicit discrete stage control
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ;; static size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg, advancing the global stage.
  ;; Origin: mover
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?p - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on ?d ?from)
      (clear ?d)

      ;; destination peg must be empty (top-clear)
      (clear ?p)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?p)

      ;; update clear/top facts
      (not (clear ?p))   ;; peg now has a top
      (clear ?from)      ;; former support (peg or disk) is now top-clear
      (clear ?d)         ;; moved disk is now top-most

      ;; advance the discrete global stage (only one action per stage possible)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto a (larger) top disk, advancing the global stage.
  ;; Requires static size ordering (smaller ?d ?t).
  ;; Origin: mover
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on ?d ?from)
      (clear ?d)

      ;; target disk must be top and larger than the moved disk
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?t)

      ;; update clear/top facts
      (not (clear ?t))   ;; target disk no longer top-clear
      (clear ?from)      ;; former support (peg or disk) is now top-clear
      (clear ?d)         ;; moved disk is now top-most

      ;; advance the discrete global stage (only one action per stage possible)
      (not (current ?s))
      (current ?s2)
    )
  )
)