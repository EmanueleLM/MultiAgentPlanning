(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; type hierarchy: disk and peg are subtypes of place
  (:types place stage)
  (:types disk peg - place)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; nothing is directly on place ?p (it is the top)
    (clear ?p - place)

    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete-stage progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from any place onto an empty peg (advance stage).
  ;; Preconditions ensure the moved disk is top at its source and the target peg is empty.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; advance the stage token (no slack or bookkeeping allowed)
      (not (current ?s))
      (current ?s2)

      ;; update stacking relations exactly
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target peg is no longer clear; source place becomes clear
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk from any place onto a larger disk (advance stage).
  ;; The 'smaller' relation enforces that no larger disk is placed on a smaller one.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance the stage token
      (not (current ?s))
      (current ?s2)

      ;; update stacking relations exactly
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target disk now has something on it; source becomes clear
      (not (clear ?to))
      (clear ?from)
    )
  )
)