(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg
    (on-disk ?d - disk ?d2 - disk)     ; disk directly on another disk
    (top ?d - disk ?p - peg)           ; disk is the top disk on peg
    (empty ?p - peg)                   ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (current ?s - step)                ; current time step
    (succ ?s1 - step ?s2 - step)       ; successor relation between steps
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?below ?from)      ; below must be the disk immediately below d on the same peg
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; the disk below becomes the new top of the source peg
      (top ?below ?from)

      (not (empty ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?below ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      ;; the disk below becomes the new top of the source peg
      (top ?below ?from)

      (not (empty ?to))
    )
  )
)