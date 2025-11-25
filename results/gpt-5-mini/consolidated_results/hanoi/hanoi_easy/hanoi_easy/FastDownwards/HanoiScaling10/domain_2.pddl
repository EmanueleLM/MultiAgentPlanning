(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is immediately on place ?p (peg or disk)
    (clear ?p - place)               ; nothing on top of place ?p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
    (stage ?s - step)                ; current discrete stage/time-step token
    (next ?s - step ?s2 - step)      ; successor relation between stages
  )

  ;; Move a top disk from any place onto an empty peg, advancing the global stage token by one successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Move a top disk from any place onto a (smaller) disk, advancing the stage token.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)