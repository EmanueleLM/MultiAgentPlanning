(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)         ; disk directly on support (disk or peg)
    (top ?p - peg ?d - disk)           ; ?d is the top disk on peg ?p
    (empty ?p - peg)                   ; peg ?p is empty
    (smaller ?a - disk ?b - disk)      ; size ordering: ?a is smaller than ?b
    (cur ?st - step)                   ; current step marker
    (succ ?s - step ?s2 - step)        ; successor relation for steps
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg) ; allowed move at step
  )

  ;; Move top disk from a peg where it is directly on that peg, to an empty peg
  (:action move_from_pegbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on ?d ?from)      ; ?d is directly on the peg ?from (no disk below)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
      (not (top ?from ?d))
      (empty ?from)
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move top disk from a peg where it is directly on another disk, to an empty peg
  (:action move_from_diskbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on ?d ?below)     ; ?d is directly on disk ?below
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
      (not (top ?from ?d))
      (top ?from ?below)
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move top disk from a peg where it is directly on that peg, to a peg whose top is disk ?td
  (:action move_from_pegbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on ?d ?from)      ; ?d directly on peg ?from
      (top ?to ?td)
      (smaller ?d ?td)   ; cannot place larger onto smaller
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?td)
      (not (top ?to ?td))
      (top ?to ?d)
      (not (top ?from ?d))
      (empty ?from)
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move top disk from a peg where it is directly on another disk, to a peg whose top is disk ?td
  (:action move_from_diskbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on ?d ?below)     ; ?d directly on disk ?below
      (top ?to ?td)
      (smaller ?d ?td)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?td)
      (not (top ?to ?td))
      (top ?to ?d)
      (not (top ?from ?d))
      (top ?from ?below)
      (not (cur ?s))
      (cur ?s2)
    )
  )
)