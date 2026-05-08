(define (domain hanoi-7-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; location relations
    (on-peg ?d - disk ?p - peg)    ; ?d is directly on peg ?p (bottom/anchored on peg)
    (on-disk ?d - disk ?b - disk)  ; ?d is directly on top of disk ?b

    ;; top/peg occupancy
    (clear ?d - disk)              ; no disk is on top of disk ?d (i.e., ?d is top)
    (empty ?p - peg)               ; peg ?p currently has no disks

    ;; static size relation
    (smaller ?d - disk ?b - disk)  ; ?d is strictly smaller than ?b

    ;; explicit discrete-time / stage control
    (step ?s - step)
    (next ?s1 - step ?s2 - step)   ; s2 is successor of s1
    (current ?s - step)            ; indicates the current stage

    ;; pairwise inequality helpers (no :equality requirement used)
    (diff-peg ?p1 - peg ?p2 - peg)
    (diff-disk ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is anchored on a peg to an empty other peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
      (diff-peg ?from ?to)
    )
    :effect (and
      ;; location updates
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)

      ;; moved disk remains top
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk, to an empty destination peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old on-disk relation, place disk as bottom on destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))

      ;; the disk that was below becomes top on its stack
      (clear ?below)

      ;; moved disk is top on new peg
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk anchored on a peg onto a strictly larger top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (current ?s)
      (next ?s ?s2)
      ;; prevent moving onto a disk that is anchored on the same source peg
      (not (on-peg ?t ?from))
    )
    :effect (and
      ;; location updates
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      ;; source peg may become empty
      (empty ?from)

      ;; topness updates
      (not (clear ?t))
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk onto a strictly larger top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (diff-disk ?d ?t)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; location updates
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      ;; the disk that was below becomes top
      (clear ?below)

      ;; the target disk is no longer top
      (not (clear ?t))

      ;; moved disk is top
      (clear ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)