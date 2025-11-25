(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; disk directly on a place (peg or disk)
    (on ?d - disk ?p - place)

    ;; nothing on top of a place (peg or disk)
    (clear ?p - place)

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete step progression
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg, consuming one step (must follow next relation).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d must be top
      (clear ?to)        ;; destination peg must be empty at top
      (not (= ?from ?to))
      (current ?s)
      (next ?s ?s2)
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
      ;; advance the current step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another disk (which must be larger), consuming one step.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ;; ?d must be top
      (clear ?target)      ;; target disk must be top (so we place on it)
      (smaller ?d ?target) ;; cannot place larger onto smaller
      (not (= ?from ?target))
      (current ?s)
      (next ?s ?s2)
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
      ;; advance the current step
      (not (current ?s))
      (current ?s2)
    )
  )
)