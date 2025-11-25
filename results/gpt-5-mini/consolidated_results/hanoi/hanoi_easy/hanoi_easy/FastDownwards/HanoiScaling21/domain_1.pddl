(define (domain hanoi-explicit-time)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly on a peg
    (on-disk ?d - disk ?d2 - disk)   ; disk directly on another disk
    (top ?p - peg ?d - disk)         ; top disk of a peg
    (empty ?p - peg)                 ; peg is empty
    (smaller ?x - disk ?y - disk)    ; x is smaller than y
    (stage ?s - stage)               ; stage objects
    (next ?s - stage ?s2 - stage)    ; successor relation on stages
    (current ?s - stage)             ; which stage is current
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-disk-on-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?from ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to a non-empty peg (onto top disk ?td)
  (:action move-disk-on-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg (no disk below) to an empty peg
  (:action move-disk-on-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg (no disk below) to a non-empty peg (onto top disk ?td)
  (:action move-disk-on-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)

      (not (current ?s))
      (current ?s2)
    )
  )
)