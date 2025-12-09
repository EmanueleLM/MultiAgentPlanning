(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    (disk ?x - place)
    (peg ?x - place)

    ;; direct support relation: disk ?d is immediately on place ?p (peg or disk)
    (on ?d - place ?p - place)

    ;; true iff nothing is directly on the place (peg or disk)
    (clear ?p - place)

    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - place ?d2 - place)

    ;; explicit discrete stage progression
    (next ?s - step ?s2 - step)
    (at-step ?s - step)
  )

  ;; Move a top disk onto an empty peg, advancing to the next discrete stage.
  (:action move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
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
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
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