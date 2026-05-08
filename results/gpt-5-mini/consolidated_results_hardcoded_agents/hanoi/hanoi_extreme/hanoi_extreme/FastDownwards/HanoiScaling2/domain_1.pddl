(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; place ?p has no disk on top
    (smaller ?d1 - disk ?d2 - disk) ; static size relation: d1 is strictly smaller than d2
    (at-step ?s - step)             ; current discrete stage marker
    (next ?s1 - step ?s2 - step)    ; successor relation between stages
  )

  ; Move a top disk from any place onto an empty peg, advancing from one stage to its successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
              (not (at-step ?s))
              (at-step ?s2)
             )
  )

  ; Move a top disk from any place onto an empty disk that is larger than the moving disk,
  ; advancing from one stage to its successor.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
              (not (at-step ?s))
              (at-step ?s2)
             )
  )
)