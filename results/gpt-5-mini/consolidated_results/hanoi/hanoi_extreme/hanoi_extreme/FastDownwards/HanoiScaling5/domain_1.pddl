(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions :adl)
  (:types disk peg - place)

  (:predicates
    ;; base predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (peg or another disk)
    (succ ?a - disk ?b - disk)   ; direct successor in size ordering (a smaller than b)
  )

  ;; derived predicates to encode ordering and top/empty/clear properties without listing many init facts
  (:derived (clear ?d - disk)
    (not (exists (?x - disk) (on ?x ?d)))
  )

  (:derived (top ?p - place ?d - disk)
    (and (on ?d ?p) (clear ?d))
  )

  (:derived (empty ?p - place)
    (not (exists (?x - disk) (on ?x ?p)))
  )

  ;; transitive closure of succ to obtain the full "smaller" relation without enumerating all pairs
  (:derived (smaller ?x - disk ?y - disk)
    (or
      (succ ?x ?y)
      (exists (?z - disk) (and (succ ?x ?z) (smaller ?z ?y)))
    )
  )

  ;; Move a top disk from one place to an empty destination place
  (:action move-to-empty
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Move a top disk from one place onto a larger disk
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
    )
  )
)