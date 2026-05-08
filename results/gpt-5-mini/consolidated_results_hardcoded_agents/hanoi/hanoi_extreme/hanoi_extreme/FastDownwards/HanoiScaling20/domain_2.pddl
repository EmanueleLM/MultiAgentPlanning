(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk is a subtype of place so disks can act as places (things can be "on" them)
  (:types place step agent disk - place)

  (:predicates
    (on ?d - disk ?p - place)        ;; disk is directly on a place (peg or another disk)
    (clear ?p - place)               ;; nothing is directly on top of this place (peg or disk)
    (larger ?big - disk ?small - disk)

    (ready ?s - step)
    (step-unmoved ?s - step)
    (moved ?s - step ?d - disk ?from - place ?to - place ?m - agent)

    (succ ?s1 - step ?s2 - step)
    (verified-step ?s - step)
    (verified-by ?s - step ?a - agent)

    (observed-initial ?a - agent)
  )

  ;; Observer must record initial observation before moves are allowed to use it.
  (:action observer-report
    :parameters (?obs - agent)
    :precondition (and)
    :effect (and
      (observed-initial ?obs)
    )
  )

  ;; Move a top disk onto an empty place (peg or an empty place).
  (:action move-to-empty
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)         ;; disk must be top on its source place
      (clear ?to)        ;; target place must be clear (no disk directly on it)
      ;; disallow placing a disk onto itself
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source place becomes clear after removing its top disk
      (clear ?from)
      ;; target place is no longer clear (now has disk on top)
      (not (clear ?to))

      ;; bookkeeping for the step
      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

  ;; Move a top disk onto another disk (target must be a disk and larger).
  (:action move-onto-disk
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - disk ?to_on - place)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)
      (on ?to ?to_on)    ;; the target disk must currently be on some place
      (clear ?to)        ;; the target disk must be top on its place
      (larger ?to ?d)    ;; size constraint: target disk is larger than moving disk
      ;; disallow trivial self-move
      (not (= ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes clear after removal
      (clear ?from)
      ;; target disk is no longer clear
      (not (clear ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

  ;; Auditor verifies the recorded moved step and enables the successor step.
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