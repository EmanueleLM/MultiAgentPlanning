(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types mover disk peg stage)

  (:predicates
    (is-mover ?m - mover)

    ;; Disk location predicates: either a disk is immediately on a peg, or immediately on another disk.
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ;; "Clear" means nothing is immediately on that object.
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; Size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2.
    (smaller ?d1 - disk ?d2 - disk)

    ;; Discrete stage progression (explicit time steps).
    (current ?s - stage)               ; single current stage
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a top disk that is on a peg to another peg.
  (:action move-peg-to-peg
    :parameters (?m - mover ?d - disk ?from - peg ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-peg ?d ?from)
      (clear-disk ?d)        ; ?d must be top at its source
      (clear-peg ?to)        ; destination peg must be empty on top
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))  ; now the destination peg is not clear
      (clear-peg ?from)      ; source peg becomes clear (top disk removed)
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is on a peg onto a disk.
  (:action move-peg-to-disk
    :parameters (?m - mover ?d - disk ?from - peg ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)       ; destination disk must have nothing on it (be top)
      (smaller ?d ?to)       ; must place smaller onto larger
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to)) ; destination disk no longer clear
      (clear-peg ?from)      ; source peg becomes clear
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is on another disk onto a peg.
  (:action move-disk-to-peg
    :parameters (?m - mover ?d - disk ?below - disk ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?below)   ; the disk below becomes clear after removing the top disk
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is on another disk onto another disk.
  (:action move-disk-to-disk
    :parameters (?m - mover ?d - disk ?below - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)
      (not (clear-disk ?to))  ; destination disk no longer clear
      (clear-disk ?below)     ; the disk below becomes clear
      (not (current ?s))
      (current ?ns)
    )
  )
)