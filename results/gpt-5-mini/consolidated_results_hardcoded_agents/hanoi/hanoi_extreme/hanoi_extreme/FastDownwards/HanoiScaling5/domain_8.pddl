(define (domain hanoi-7-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg step)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d - disk ?b - disk)
    (step ?s - step)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg.
  (:action move_to_peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto an empty disk that is larger.
  (:action move_to_disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)