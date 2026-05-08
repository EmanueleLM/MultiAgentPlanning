(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (i.e., bottom disk of a stack)
    (on-disk ?d - disk ?d2 - disk)    ; disk d is directly on top of disk d2
    (top ?p - peg ?d - disk)          ; disk d is the top disk on peg p
    (empty ?p - peg)                  ; peg p has no disks
    (smaller ?x - disk ?y - disk)     ; disk x is strictly smaller than disk y
    (succ ?a - stage ?b - stage)      ; successor relation over discrete stages (time steps)
    (at-stage ?s - stage)             ; current stage marker (ensures single action per stage)
    (different ?p1 - peg ?p2 - peg)   ; distinct peg relation (forbids no-op moves)
  )

  ;; Move a top disk that is the sole disk on ?from (it is recorded as on-peg)
  ;; to an empty target peg ?to.
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

      ;; advance stage (enforces single action per stage)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is the sole disk on ?from (on-peg) onto the top of a non-empty destination peg ?to.
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
      (top ?from ?below)

      ;; place d on target peg
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