(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk directly on some support (either a disk or a peg)
    (on ?d - disk ?p - object)
    ;; nothing on top of this object (either a disk or a peg)
    (clear ?o - object)
    ;; size ordering: a disk is smaller than another disk or a peg
    (smaller ?d - disk ?p - object)
  )

  ;; Move the top disk ?d from support ?from to support ?to.
  ;; Preconditions:
  ;;   - ?d is directly on ?from
  ;;   - ?d is clear (it is the top disk of its stack)
  ;;   - ?to is clear (either an empty peg or the top disk of another stack)
  ;;   - ?d is smaller than ?to (enforces no larger-on-smaller)
  ;; Effects:
  ;;   - update direct support and clearness of involved supports
  (:action move-top
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)