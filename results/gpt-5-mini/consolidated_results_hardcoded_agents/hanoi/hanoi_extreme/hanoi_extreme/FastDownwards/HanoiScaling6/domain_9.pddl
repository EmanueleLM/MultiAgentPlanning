(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)     ; disk ?d is directly on place ?p (a disk or a peg)
    (clear ?p - place)           ; place ?p (disk or peg) has no disk on top (= top)
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is strictly smaller than ?d2
    (current ?s - step)          ; current timestep/state
    (next ?s1 - step ?s2 - step) ; temporal succession
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
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
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (destination must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
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
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?under)
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk onto a top disk (destination must be larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?under)
      (clear ?d)
      (not (current ?s))
      (current ?s2)
    )
  )
)