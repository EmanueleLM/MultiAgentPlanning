(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support)

  ;; Predicates
  ;; on ?d ?s: disk ?d is immediately on support ?s (support = disk or peg)
  ;; clear ?s: support ?s has nothing immediately on top of it
  ;; larger ?x ?y: disk ?x is strictly larger than disk ?y
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (larger ?x - disk ?y - disk)
  )

  ;; Move a top disk onto an empty peg.
  ;; Preconditions enforce that ?d is the top disk of its current support and that the target peg is empty.
  ;; Effects update on/clear facts: remove on(?d,?from), add on(?d,?peg),
  ;; mark the destination peg not clear and the source support clear.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  ;; Move a top disk onto a top disk that is larger.
  ;; Preconditions enforce that ?d is top on its support, that ?to is top (clear),
  ;; and that ?to is strictly larger than ?d.
  ;; Effects update on/clear facts similarly to move-to-peg.
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)