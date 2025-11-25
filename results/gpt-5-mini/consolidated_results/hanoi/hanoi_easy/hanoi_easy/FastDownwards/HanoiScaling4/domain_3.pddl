(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    (disk ?x - obj)
    (peg ?x - obj)
    (on ?d - obj ?p - obj)         ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - obj)               ; nothing on top of this place (disk or peg)
    (smaller ?d1 - obj ?d2 - obj)  ; size ordering: ?d1 is smaller than ?d2 (static)
    (at-step ?s - step)            ; current discrete stage
    (next ?s1 - step ?s2 - step)   ; successor relation for stages
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
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

  ;; Move a top disk onto another top disk (destination disk must be larger)
  (:action move-to-disk
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
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