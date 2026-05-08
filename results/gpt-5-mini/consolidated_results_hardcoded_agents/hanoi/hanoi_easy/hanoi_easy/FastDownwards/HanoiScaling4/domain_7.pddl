(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)               ; nothing directly on top of this place (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (at-step ?s - step)              ; current discrete stage
    (next ?s1 - step ?s2 - step)     ; successor relation for stages
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)