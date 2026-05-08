(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    (smaller ?d1 - disk ?d2 - disk)        ; static size ordering: ?d1 is smaller than ?d2
    (on ?d - disk ?s - object)             ; immediate support: ?d is directly on ?s (s is a disk or a peg)
    (top ?d - disk ?p - peg)               ; ?d is the top disk of peg ?p
    (empty ?p - peg)                       ; peg ?p has no disks
    (succ ?s - stage ?s2 - stage)          ; stage ordering: ?s2 is the successor of ?s
    (active ?s - stage)                    ; which stage is current (exactly one active at a time)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-top-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)    ; disk is directly on the source peg (so it is alone on that peg)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk of another peg.
  (:action move-top-from-peg-onto-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)        ; d directly on source peg (so source becomes empty)
      (top ?t ?to)         ; target peg has top disk t
      (smaller ?d ?t)      ; size constraint: cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (not (top ?d ?from))
      (empty ?from)
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-top-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)     ; d is directly on disk ?below (so after moving, ?below becomes top)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (top ?below ?from)   ; the disk that was below becomes top of the source peg
      (not (empty ?to))
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto the top disk of another peg.
  (:action move-top-from-disk-onto-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)       ; d is directly on disk ?below (so ?below becomes top after removal)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (not (top ?d ?from))
      (top ?below ?from)
      (not (active ?s))
      (active ?s2)
    )
  )
)