(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg step agent)
  (:predicates
    ;; physical stack relations
    (on ?d - disk ?p - place)       ;; disk is directly on a place (peg or another disk)
    (clear ?p - place)             ;; nothing is directly on top of this place (peg or disk)
    (larger ?big - disk ?small - disk)

    ;; staging and verification
    (ready ?s - step)
    (step-unmoved ?s - step)
    (moved ?s - step ?d - disk ?from - place ?to - place ?m - agent)

    ;; step ordering and audit trace
    (succ ?s1 - step ?s2 - step)
    (verified-step ?s - step)
    (verified-by ?s - step ?a - agent)

    ;; observer recorded initial world
    (observed-initial ?a - agent)
  )

  ;; Observer records initial state (must be performed before moves that require the observation).
  (:action observer-report
    :parameters (?obs - agent)
    :precondition ()
    :effect (observed-initial ?obs)
  )

  ;; Move a top disk onto an empty peg (target is an empty peg).
  (:action move-to-empty-peg
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)        ;; disk must be top on its source place
      (clear ?to)       ;; target peg must be empty at top (no disk directly on it)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: source becomes clear (nothing on it after removing top)
      (clear ?from)
      ;; target is no longer clear (disk placed onto it)
      (not (clear ?to))

      ;; step bookkeeping: consume this step's opportunity and record the move
      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

  ;; Move a top disk onto another disk (target is a disk and must be larger).
  (:action move-to-disk
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - disk ?topdisk - disk)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)
      (on ?topdisk ?to)    ;; ensure ?to denotes the place that currently has a top disk ?topdisk
      (clear ?to)          ;; the disk (place) we are placing onto must be clear (no disk on top)
      (larger ?to ?d)      ;; size constraint: the disk we place on must be larger
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes clear after removing the top disk
      (clear ?from)
      ;; target disk is no longer clear (now has a disk on top)
      (not (clear ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

  ;; Auditor verifies the move at step ?st and advances readiness to successor step ?stn.
  (:action auditor-verify-advance
    :parameters (?st - step ?d - disk ?from - place ?to - place ?m - agent ?aud - agent ?stn - step)
    :precondition (and
      (moved ?st ?d ?from ?to ?m)
      (succ ?st ?stn)
    )
    :effect (and
      (not (moved ?st ?d ?from ?to ?m))
      (verified-step ?st)
      (verified-by ?st ?aud)
      (ready ?stn)
    )
  )
)