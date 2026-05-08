(define (domain hanoi-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly supported by peg
    (on-disk ?d - disk ?below - disk) ; disk directly supported by another disk
    (top ?p - peg ?d - disk)         ; top disk on a peg
    (empty ?p - peg)                 ; peg has no disks
    (smaller ?x - disk ?y - disk)    ; size ordering: x is smaller than y
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a disk that is directly supported by a peg (and is the top of that peg)
  ;; onto an empty target peg (source peg must become empty).
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; place disk on target peg as top
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly supported by a peg (and is the top of that peg)
  ;; onto the top disk of another peg (destination must have a top disk larger than moved disk).
  (:action move-from-peg-to-disk
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
      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; place on top of destination disk
      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (and is the top of its peg)
  ;; onto an empty target peg. Update source peg top to the supporting disk.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?from ?d)
      (empty ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove support relation and update source top
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place disk on empty target peg
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (and is the top of its peg)
  ;; onto the top disk of another peg (destination top must be larger).
  (:action move-from-disk-to-disk
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
      ;; remove support relation and update source top
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place d on top of td at destination
      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)