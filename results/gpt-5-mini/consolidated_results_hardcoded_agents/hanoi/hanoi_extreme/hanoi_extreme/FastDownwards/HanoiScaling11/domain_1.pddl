(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types place time disk peg - place) 
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d - disk ?p - place)
    (succ ?t - time ?t1 - time)
    (current ?t - time)
  )

  (:action move
    :parameters (?d - disk ?from - place ?to - place ?t - time ?t1 - time)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (succ ?t ?t1)
      (current ?t)
      (not (= ?from ?to))
    )
    :effect (and
      ;; change support of moved disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear status: destination no longer clear, origin becomes clear,
      ;; moved disk remains clear (no disk on top immediately after move)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      ;; advance the explicit stage pointer to the successor time
      (not (current ?t))
      (current ?t1)
    )
  )
)