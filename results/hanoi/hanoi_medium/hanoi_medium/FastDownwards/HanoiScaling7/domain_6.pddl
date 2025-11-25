(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; immediate support relation: disk ?d is immediately on place ?p (peg or disk)
    (on ?d - disk ?p - place)

    ;; true iff nothing is directly on the place (peg or disk)
    (clear ?p - place)

    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (next ?s - step ?s2 - step)
    (at-step ?s - step)
  )

  ;; Move a top disk onto an empty peg, advancing to the next discrete stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (next ?s ?s2)
      (at-step ?s)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)

      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk onto another top disk (destination must be larger),
  ;; advancing to the next discrete stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
      (next ?s ?s2)
      (at-step ?s)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)

      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)