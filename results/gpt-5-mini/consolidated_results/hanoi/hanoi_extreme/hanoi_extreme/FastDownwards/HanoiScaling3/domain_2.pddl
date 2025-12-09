(define (domain tower-of-hanoi-staged)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (disk ?d)
    (peg ?p)
    (on ?d ?x)            ; disk ?d is directly on location ?x (either a disk or a peg)
    (clear ?x)            ; location ?x (disk or peg) has nothing on top
    (smaller ?x ?y)       ; disk ?x is smaller than disk ?y
    (current ?s)          ; current stage/timepoint
    (next ?s1 ?s2)        ; ordering of stages: s2 is the immediate successor of s1
  )

  (:action move-to-peg
    :parameters (?d ?from ?to ?s ?s2)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
      (clear ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?d ?from ?to ?s ?s2)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (disk ?d)
      (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)