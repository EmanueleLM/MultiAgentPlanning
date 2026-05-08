(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (disk ?x - object)                     ; marks disk objects
    (peg ?x - object)                      ; marks peg objects
    (on ?d - object ?p - object)           ; disk ?d is directly on object ?p (peg or disk)
    (clear ?x - object)                    ; nothing is directly on ?x (x is a top object / empty peg)
    (smaller ?d1 - object ?d2 - object)    ; d1 is strictly smaller than d2
    (allow-place ?d - object ?p - object)  ; static: disk d may be placed on p (peg or larger disk)
    (current ?s - step)                    ; current time step marker
    (next ?s1 - step ?s2 - step)           ; successor relation between steps
  )

  ; Single move action: move a top disk at the current step to a clear destination,
  ; advancing time to the successor step. No conditional effects, all checks are explicit.
  (:action move
    :parameters (?d - object ?from - object ?to - object ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allow-place ?d ?to)
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