(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; placement relations
    (on-peg ?d - disk ?p - peg)      ; disk directly on peg (bottom-most on that peg)
    (on-disk ?d - disk ?below - disk) ; disk directly on another disk (d is on top of below)

    ;; top-of-peg and peg emptiness
    (top ?d - disk ?p - peg)         ; disk is the top disk of peg
    (empty ?p - peg)                 ; peg has no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage control (discrete time progression)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)

    ;; explicit disequality for pegs (to avoid using numeric equality)
    (diff ?p - peg ?q - peg)
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove placement/top at source (disk was the only disk on source)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty
      (empty ?from)

      ;; place disk on target peg and update target top/empty
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move a disk that is directly on a peg to be on top of another disk on a (non-empty) target peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove placement/top at source (disk was the only disk on source)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty
      (empty ?from)

      ;; place moved disk on target disk and update tops
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      (not (empty ?to))
    )
  )

  ;; Move a disk that is atop another disk to an empty target peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove old on-disk/top at source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; below disk becomes top at source (source is not empty)
      (top ?below ?from)

      ;; place moved disk on target peg and update target top/empty
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is atop another disk to be atop another disk on a target peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove old on-disk/top at source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; below disk becomes top at source
      (top ?below ?from)

      ;; place moved disk on target disk and update tops
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
      (not (empty ?to))
    )
  )
)