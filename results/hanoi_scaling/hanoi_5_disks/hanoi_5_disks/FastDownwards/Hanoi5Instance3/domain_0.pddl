(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; on ?d ?p  -- disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; clear ?p -- there is no disk directly on place ?p (place = peg or disk)
    (clear ?p - place)
    ;; smaller ?x ?y -- disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a clear disk onto an empty peg
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a clear disk onto the top of another disk (target disk must be larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)