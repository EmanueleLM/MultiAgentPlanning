(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement relations
    (on-disk ?d - disk ?s - disk)    ; ?d is directly on disk ?s
    (on-peg  ?d - disk ?p - peg)     ; ?d is on peg ?p (somewhere in that peg's stack)

    ;; top-of-peg and peg emptiness
    (top   ?d - disk ?p - peg)       ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p is empty

    ;; whether a disk has a disk directly under it
    (has-support ?d - disk)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit stage progression control
    (current-stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk that is directly on its source peg (no support) to an empty destination peg.
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
      ;; advance stage (one move per stage)
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty
      (empty ?from)

      ;; place on destination peg (now top there)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; moved disk has no support (sits on peg)
      (not (has-support ?d))
    )
  )

  ;; Move a top disk that is directly on its source peg (no support) onto the top disk of a non-empty destination peg.
  (:action move-bottom-to-top
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)           ; preserve size ordering (cannot place larger on smaller)
      (not (has-support ?d))
      (not (= ?from ?to))
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty (disk had no support)
      (empty ?from)

      ;; place on destination disk ?t
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; moved disk now has support (the disk ?t beneath it)
      (has-support ?d)
    )
  )

  ;; Move a top disk that sits on another disk (?below) to an empty destination peg.
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
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (has-support ?d))
      (not (top ?d ?from))

      ;; moved disk is now on destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; the disk that was below becomes the new top on the source peg
      (top ?below ?from)

      ;; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))
    )
  )

  ;; Move a top disk that sits on another disk (?below) onto the top disk (?t) of the destination peg.
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
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (has-support ?d))

      ;; moved disk is now directly on disk ?t and top on that peg
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; the disk that was below becomes the new top on the source peg
      (top ?below ?from)

      ;; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))

      ;; moved disk now has support (the disk ?t beneath it)
      (has-support ?d)
    )
  )
)