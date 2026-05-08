(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom-most connection)
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ; peg ?p is empty
    (smaller ?a - disk ?b - disk)     ; ?a is smaller than ?b (size ordering)
    (cur ?s - step)                   ; current step/stage
    (succ ?s - step ?s2 - step)       ; successor relation between steps (contiguous order)
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
      ;; remove disk from source peg, place it on target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; target is no longer empty; update its top
      (not (empty ?to))
      (top ?to ?d)

      ;; source top removed; source becomes empty
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
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove link to the disk below and place disk directly on target peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; target peg now has new top and is not empty
      (not (empty ?to))
      (top ?to ?d)

      ;; source peg top removed; the disk below becomes the new top
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
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?td)
      (smaller ?d ?td)   ; ensure no larger on smaller
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove disk from source peg, place it on the target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?td)

      ;; update top on target peg
      (not (top ?to ?td))
      (top ?to ?d)

      ;; source peg becomes empty (disk was directly on peg)
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
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?td)
      (smaller ?d ?td)   ; ensure no larger on smaller
      (succ ?s ?s2)
    )
    :effect (and
      ;; detach from below and attach onto target disk
      (not (on-disk ?d ?below))
      (on-disk ?d ?td)

      ;; update top on target peg
      (not (top ?to ?td))
      (top ?to ?d)

      ;; source peg's new top becomes the disk below
      (not (top ?from ?d))
      (top ?from ?below)

      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )
)