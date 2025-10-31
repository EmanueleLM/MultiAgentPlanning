(define (domain hanoi-7-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ; disk ?d is directly on place ?p (a peg or another disk)
    (on ?d - disk ?p - place)
    ; place (disk or peg) has nothing directly on top
    (clear ?p - place)
    ; ordering: ?d1 strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk onto an empty peg (target is a peg)
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

  ; Move a top disk onto another disk (target is a disk, must be larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)