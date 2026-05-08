(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)                ; disk ?d is on peg ?p
    (top ?d - disk ?p - peg)               ; disk ?d is the top disk on peg ?p
    (directly_on ?d - disk ?e - disk)      ; disk ?d is directly on disk ?e (e is immediately below d)
    (peg_empty ?p - peg)                   ; peg ?p has no disks
    (larger ?x - disk ?y - disk)           ; static: ?x is larger than ?y
  )

  ; Move a disk that is the only disk on its source peg onto an empty target peg
  (:action move-sole-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (peg_empty ?to)
      (not (= ?from ?to))
      (not (directly_on ?d A))
      (not (directly_on ?d B))
      (not (directly_on ?d C))
      (not (directly_on ?d D))
      (not (directly_on ?d E))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg_empty ?to))
      (peg_empty ?from)
    )
  )

  ; Move a disk that is the only disk on its source peg onto a non-empty target peg (with known target top)
  (:action move-sole-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (top ?t ?to)
      (larger ?t ?d)
      (not (= ?from ?to))
      (not (peg_empty ?to))
      (not (directly_on ?d A))
      (not (directly_on ?d B))
      (not (directly_on ?d C))
      (not (directly_on ?d D))
      (not (directly_on ?d E))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?t ?to))
      (directly_on ?d ?t)
      (top ?d ?to)
      (not (top ?d ?from))
      (peg_empty ?from)
    )
  )

  ; Move a disk that has a disk directly below it on its source peg onto an empty target peg
  (:action move-with-below-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (directly_on ?d ?b)
      (peg_empty ?to)
      (not (= ?from ?to))
      (not (peg_empty ?from))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (directly_on ?d ?b))
      (top ?b ?from)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg_empty ?to))
    )
  )

  ; Move a disk that has a disk directly below it on its source peg onto a non-empty target peg (with known target top)
  (:action move-with-below-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (directly_on ?d ?b)
      (top ?t ?to)
      (larger ?t ?d)
      (not (= ?from ?to))
      (not (peg_empty ?to))
      (not (peg_empty ?from))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (directly_on ?d ?b))
      (top ?b ?from)
      (not (top ?t ?to))
      (directly_on ?d ?t)
      (top ?d ?to)
      (not (top ?d ?from))
    )
  )
)