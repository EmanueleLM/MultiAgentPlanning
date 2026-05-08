(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; direct placement relations
    (on-peg ?d - disk ?p - peg)     ; disk directly on peg
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk

    ;; peg properties
    (top ?p - peg ?d - disk)        ; ?d is the top disk on peg ?p
    (empty ?p - peg)                ; peg ?p is empty

    ;; size ordering
    (smaller ?a - disk ?b - disk)   ; ?a is smaller than ?b

    ;; step sequencing and allowed moves
    (cur ?s - step)
    (succ ?s - step ?s2 - step)
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg)
  )

  ;; Move a top disk that is directly on a peg, to an empty peg
  (:action move_from_pegbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove old placement
      (not (on-peg ?d ?from))
      ;; add new placement
      (on-peg ?d ?to)

      ;; update top/empty for destination
      (not (empty ?to))
      (top ?to ?d)

      ;; update top/empty for source (source becomes empty)
      (not (top ?from ?d))
      (empty ?from)

      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk, to an empty peg
  (:action move_from_diskbelow_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove old placement
      (not (on-disk ?d ?below))
      ;; add new placement on peg
      (on-peg ?d ?to)

      ;; update destination
      (not (empty ?to))
      (top ?to ?d)

      ;; update source top: now the disk below becomes top on the source peg
      (not (top ?from ?d))
      (top ?from ?below)

      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, to a peg whose top is disk ?td
  (:action move_from_pegbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?td)
      (smaller ?d ?td)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove old placement
      (not (on-peg ?d ?from))
      ;; add new placement on disk ?td
      (on-disk ?d ?td)

      ;; update destination top
      (not (top ?to ?td))
      (top ?to ?d)

      ;; update source (source becomes empty)
      (not (top ?from ?d))
      (empty ?from)

      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk, to a peg whose top is disk ?td
  (:action move_from_diskbelow_to_onto
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?td - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?td)
      (smaller ?d ?td)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove old placement
      (not (on-disk ?d ?below))
      ;; add new placement on disk ?td
      (on-disk ?d ?td)

      ;; update destination top
      (not (top ?to ?td))
      (top ?to ?d)

      ;; update source top: the disk below becomes new top on the source peg
      (not (top ?from ?d))
      (top ?from ?below)

      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )
)