(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ; peg ?p is empty
    (smaller ?a - disk ?b - disk)     ; ?a is smaller than ?b
    (cur ?s - step)                   ; current step/stage
    (succ ?s - step ?s2 - step)       ; successor relation between steps
  )

  ;; Move a top disk that is directly on a peg, to an empty peg
  (:action move_from_pegbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (empty ?to))
      (top ?to ?d)

      (not (top ?from ?d))
      (empty ?from)

      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk, to an empty peg
  (:action move_from_diskbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (empty ?to))
      (top ?to ?d)

      (not (top ?from ?d))
      (top ?from ?below)

      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, to a peg whose top is disk ?td
  (:action move_from_pegbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?td)
      (smaller ?d ?td)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (empty ?from)

      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk, to a peg whose top is disk ?td
  (:action move_from_diskbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?td)
      (smaller ?d ?td)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (top ?from ?below)

      (not (cur ?s))
      (cur ?s2)
    )
  )
)