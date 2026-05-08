(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk)

  (:predicates
    (on ?d - disk ?p - place)    ; disk directly on a place (peg or disk)
    (clear ?p - place)           ; nothing directly on this place
    (smaller ?d1 - disk ?d2 - disk) ; immediate-size ordering: ?d1 is immediately smaller than ?d2
  )

  ;; Move a top disk to an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto another disk, allowed only when the moved disk is smaller (transitively).
  ;; Transitive "smaller" up to required chain length is expanded in the precondition so the init
  ;; needs only immediate adjacent smaller facts.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?x1 - disk ?x2 - disk ?x3 - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (or
        (smaller ?d ?to)
        (and (smaller ?d ?x1) (smaller ?x1 ?to))
        (and (smaller ?d ?x1) (smaller ?x1 ?x2) (smaller ?x2 ?to))
        (and (smaller ?d ?x1) (smaller ?x1 ?x2) (smaller ?x2 ?x3) (smaller ?x3 ?to))
      )
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)