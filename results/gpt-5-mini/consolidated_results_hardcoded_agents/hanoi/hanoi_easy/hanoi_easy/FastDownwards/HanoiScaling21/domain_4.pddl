(define (domain hanoi-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; disk directly supported by a peg
    (on-peg ?d - disk ?p - peg)

    ;; disk directly supported by another disk
    (on-disk ?d - disk ?below - disk)

    ;; top of a peg is a disk
    (top ?p - peg ?d - disk)

    ;; peg is empty (no top)
    (empty ?p - peg)

    ;; disk size ordering: smaller x y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; stages/timepoints and their ordering
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a disk that is directly on a peg onto an empty target peg
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
      ;; remove support relation from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))

      ;; source peg becomes empty
      (empty ?from)

      ;; place disk on target peg and make it top
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; advance stage/time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto the top disk of another peg
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
      ;; remove relation from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))

      ;; source peg becomes empty
      (empty ?from)

      ;; place disk on top of target disk
      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)

      ;; advance stage/time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (and is top of its peg) onto an empty peg
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
      ;; remove support relation from below disk and update source peg top
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place disk on empty target peg
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; advance stage/time
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (and is top of its peg) onto the top disk of another peg
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
      ;; remove support from below disk and update source peg top
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place d on top of td at destination
      (not (top ?to ?td))
      (on-disk ?d ?td)
      (top ?to ?d)

      ;; advance stage/time
      (not (current ?s))
      (current ?s2)
    )
  )
)