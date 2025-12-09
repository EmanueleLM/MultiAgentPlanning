(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; disk support and location relations
    (on-disk ?d - disk ?s - disk)    ; disk ?d is directly on disk ?s
    (on-peg  ?d - disk ?p - peg)     ; disk ?d is on peg ?p (somewhere in that peg's stack)

    ; top-of-peg and emptiness
    (top   ?d - disk ?p - peg)       ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p has no disks

    ; whether a disk has a disk under it (direct support)
    (has-support ?d - disk)

    ; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ; explicit stage progression control (only one stage true at a time)
    (current-stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ; Move a top disk that has no disk under it (it is directly on the peg)
  ; to an empty destination peg.
  (:action move-bottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (has-support ?d))
      (not (= ?from ?to))
    )
    :effect (and
      ; stage advance (enforces one move per stage)
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; place on destination peg (now top there)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ; source peg becomes empty
      (empty ?from)

      ; moved disk has no support beneath it (it sits on peg)
      (not (has-support ?d))
    )
  )

  ; Move a top disk that has no disk under it (directly on source peg)
  ; onto the top disk of a non-empty destination peg.
  (:action move-bottom-to-top
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)           ; disk size ordering
      (not (has-support ?d))
      (not (= ?from ?to))
    )
    :effect (and
      ; stage advance
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove from source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; place on destination disk ?t
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      ; source peg becomes empty
      (empty ?from)

      ; moved disk now has support (the disk ?t beneath it)
      (has-support ?d)
    )
  )

  ; Move a top disk that sits on another disk (?below) to an empty destination peg.
  (:action move-notbottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (has-support ?d)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; stage advance
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (has-support ?d))
      (not (top ?d ?from))

      ; moved disk is now on destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ; the disk that was below becomes the new top on the source peg
      (top ?below ?from)

      ; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))
    )
  )

  ; Move a top disk that sits on another disk (?below) onto the top disk of the destination peg.
  (:action move-notbottom-to-top
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (has-support ?d)
      (not (= ?from ?to))
    )
    :effect (and
      ; stage advance
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (has-support ?d))

      ; moved disk is now directly on disk ?t and top on that peg
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      ; the disk that was below becomes the new top on the source peg
      (top ?below ?from)

      ; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))

      ; moved disk now has support (the disk ?t beneath it)
      (has-support ?d)
    )
  )
)