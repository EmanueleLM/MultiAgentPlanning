(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?below - disk)  ; ?d is directly on top of disk ?below
    (on-peg  ?d - disk ?p - peg)       ; ?d is directly on peg ?p (i.e., bottom disk of that peg)

    ;; current top disk of a peg
    (top ?d - disk ?p - peg)           ; disk ?d is the top disk of peg ?p

    ;; peg emptiness
    (empty ?p - peg)                   ; peg ?p currently has no disks

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2

    ;; discrete stage progression
    (current ?s - step)                ; current stage
    (next ?s1 - step ?s2 - step)       ; successor relation between stages

    ;; distinctness relation for pegs to forbid no-op moves (moving to same peg)
    (different ?p1 - peg ?p2 - peg)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; step progression
      (not (current ?s))
      (current ?s2)

      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; place disk on target peg
      (on-peg ?d ?to)
      (top ?d ?to)

      ;; update emptiness
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; step progression
      (not (current ?s))
      (current ?s2)

      ;; remove from source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; place on target disk
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)

      ;; source peg becomes empty (disk was directly on peg and was the only disk)
      (empty ?from)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; step progression
      (not (current ?s))
      (current ?s2)

      ;; remove from source stack
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; the disk below becomes the new top on the source peg
      (top ?below ?from)

      ;; add to target peg
      (on-peg ?d ?to)
      (top ?d ?to)

      ;; update emptiness of target
      (not (empty ?to))

      ;; source peg remains non-empty because ?below remains
      (not (empty ?from))
    )
  )

  ;; Move a top disk that is directly on another disk onto the top disk of another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; step progression
      (not (current ?s))
      (current ?s2)

      ;; remove from source stack
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; below becomes top on source peg
      (top ?below ?from)

      ;; update target: previous top no longer top, new on-disk relation and top
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)

      ;; source peg remains non-empty because ?below remains
      (not (empty ?from))
    )
  )
)