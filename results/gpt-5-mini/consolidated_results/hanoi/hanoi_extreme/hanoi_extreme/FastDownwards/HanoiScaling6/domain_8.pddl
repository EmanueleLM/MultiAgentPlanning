(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg step - object
  )

  (:predicates
    ;; disk is directly on either a peg or another disk
    (on ?d - disk ?p - object)
    ;; object (disk or peg) is clear / top (no disk on it)
    (clear ?o - object)
    ;; size ordering: smaller d1 d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal progression
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
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
      ;; destination peg becomes occupied
      (not (clear ?to))
      ;; source peg becomes clear
      (clear ?from)
      ;; moved disk remains top
      (clear ?d)
      ;; advance time
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
      ;; destination disk is no longer top
      (not (clear ?to))
      ;; source peg becomes clear
      (clear ?from)
      ;; moved disk is top
      (clear ?d)
      ;; advance time
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
      ;; destination peg becomes occupied
      (not (clear ?to))
      ;; the disk that was under becomes top
      (clear ?under)
      ;; moved disk is top
      (clear ?d)
      ;; advance time
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
      ;; destination disk no longer top
      (not (clear ?to))
      ;; the disk that was under becomes top
      (clear ?under)
      ;; moved disk is top
      (clear ?d)
      ;; advance time
      (not (current ?s))
      (current ?s2)
    )
  )
)