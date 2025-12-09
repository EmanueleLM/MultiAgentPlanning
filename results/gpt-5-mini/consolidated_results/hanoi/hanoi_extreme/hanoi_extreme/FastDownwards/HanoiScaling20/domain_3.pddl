(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step agent disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (larger ?big - disk ?small - disk)

    (ready ?s - step)
    (step-unmoved ?s - step)
    (moved ?s - step ?d - disk ?from - place ?to - place ?m - agent)

    (succ ?s1 - step ?s2 - step)
    (verified-step ?s - step)
    (verified-by ?s - agent)

    (observed-initial ?a - agent)
  )

  (:action observer-report
    :parameters (?obs - agent)
    :precondition (and)
    :effect (and
      (observed-initial ?obs)
    )
  )

  (:action move-to-empty
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

  (:action move-onto-disk
    :parameters (?st - step ?obs - agent ?m - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?obs)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))

      (not (step-unmoved ?st))
      (not (ready ?st))
      (moved ?st ?d ?from ?to ?m)
    )
  )

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