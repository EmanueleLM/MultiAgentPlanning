(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (bottom-most disk on that peg)
    (on-disk ?d - disk ?d2 - disk)    ; disk d is directly on top of disk d2
    (top ?p - peg ?d - disk)          ; disk d is the current top disk on peg p
    (empty ?p - peg)                  ; peg p currently has no disks
    (smaller ?x - disk ?y - disk)     ; static: disk x is strictly smaller than disk y
    (succ ?a - stage ?b - stage)      ; successor relation between contiguous stages
    (at-stage ?s - stage)             ; single current stage marker (enforces one action per stage)
    (different ?p1 - peg ?p2 - peg)   ; explicit distinctness of peg pairs (forbids no-op moves)
  )

  ;; Move a top disk that is directly on the source peg (it is the sole disk on the peg)
  ;; to an empty destination peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; detach from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; attach to target peg as the sole disk
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?to ?d)

      ;; advance stage (one action per stage)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on the source peg (sole on its peg)
  ;; onto the top of a non-empty destination peg (destination top must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; detach from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; attach onto destination disk
      (on-disk ?d ?desttop)
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits on another disk (?below) to an empty peg ?to.
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; detach d from below on source
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      ;; below becomes the new top on source peg
      (top ?from ?below)

      ;; place d on target peg as sole disk
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that sits on another disk (?below) onto the top of a non-empty destination disk (?desttop).
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; detach d from below on source
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      ;; below becomes the new top on source peg
      (top ?from ?below)

      ;; attach d on destination top
      (on-disk ?d ?desttop)
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)