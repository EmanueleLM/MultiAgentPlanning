(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk is directly on place (place = disk or peg)
    (clear ?p - place)              ; nothing on top of place (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 strictly smaller than ?d2
    (at-step ?s - step)             ; current global stage/step
    (succ ?s1 - step ?s2 - step)    ; successor relation between steps
  )

  ;; Move a disk onto another disk (destination disk must be larger and clear).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)