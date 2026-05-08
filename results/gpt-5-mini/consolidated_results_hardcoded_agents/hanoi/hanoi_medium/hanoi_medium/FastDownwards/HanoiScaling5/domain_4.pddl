(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  ;; Type hierarchy: disk and peg are subtypes of place
  (:types disk peg - place step)

  (:predicates
    ;; disk directly on a place (peg or disk)
    (on ?d - disk ?p - place)

    ;; nothing on top of a place (peg or disk)
    (clear ?p - place)

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete step progression: which step is current and successor relation
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from its current support onto an empty peg, consuming one step.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)               ;; ?d must be top (nothing on top of it)
      (clear ?to)              ;; destination peg must be empty (no top disk)
      (current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))      ;; forbid no-op moves onto same place
    )
    :effect (and
      ;; remove old support link
      (not (on ?d ?from))
      ;; place on new peg
      (on ?d ?to)
      ;; the former support now becomes clear (nothing on top)
      (clear ?from)
      ;; the destination peg is no longer clear (has a top disk now)
      (not (clear ?to))
      ;; advance the current step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from its current support onto another disk (which must be larger), consuming one step.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)               ;; ?d must be top
      (clear ?target)          ;; target disk must be top (so we place on it)
      (smaller ?d ?target)     ;; cannot place larger onto smaller
      (current ?s)
      (next ?s ?s2)
      (not (= ?d ?target))     ;; forbid placing a disk onto itself
      (not (= ?from ?target))  ;; forbid no-op where from == target
    )
    :effect (and
      ;; remove old support link
      (not (on ?d ?from))
      ;; place on target disk
      (on ?d ?target)
      ;; the former support has no disk on top now
      (clear ?from)
      ;; the target disk is no longer clear (has a disk on top now)
      (not (clear ?target))
      ;; advance the current step
      (not (current ?s))
      (current ?s2)
    )
  )
)