(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk directly on a place (either a peg or another disk)
    (on ?d - disk ?p - (either disk peg))

    ;; nothing on top of a place (peg or disk)
    (clear ?p - (either disk peg))

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d must be top
      (clear ?to)        ;; destination peg must be empty at top
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove old support
      (not (on ?d ?from))
      ;; place on new peg
      (on ?d ?to)
      ;; the former support becomes clear
      (clear ?from)
      ;; the destination peg is no longer clear
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto another disk (which must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ;; ?d must be top
      (clear ?target)      ;; target disk must be top (so we place on it)
      (smaller ?d ?target) ;; cannot place larger onto smaller
      (not (= ?d ?target))
      (not (= ?from ?target))
    )
    :effect (and
      ;; remove old support
      (not (on ?d ?from))
      ;; place on target disk
      (on ?d ?target)
      ;; the former support becomes clear
      (clear ?from)
      ;; the target is no longer clear
      (not (clear ?target))
    )
  )
)