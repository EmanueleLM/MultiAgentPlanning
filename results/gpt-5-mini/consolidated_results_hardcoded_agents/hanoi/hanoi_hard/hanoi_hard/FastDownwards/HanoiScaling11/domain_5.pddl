(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk d is directly on peg p (i.e., it is the bottom disk of that peg)
    (on-peg ?d - disk ?p - peg)
    ;; disk d is directly on top of disk below
    (on-disk ?d - disk ?below - disk)
    ;; peg p has top disk d
    (top ?p - peg ?d - disk)
    ;; peg p is empty
    (empty ?p - peg)
    ;; disk x is smaller than disk y
    (smaller ?x - disk ?y - disk)
    ;; temporal successor relation between stages
    (succ ?s - step ?s2 - step)
    ;; current stage
    (current ?s - step)
  )

  ;; Move a disk that is the sole disk on its source peg onto an empty target peg.
  (:action move-bottom-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; source updates
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ;; target updates
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is the sole disk on its source peg onto another disk (target top).
  (:action move-bottom-to-disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; source becomes empty
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ;; target stack grows
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is on top of another disk (has a disk below) onto an empty target peg.
  (:action move-on-disk-to-empty
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (empty ?pto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove link between moved disk and the disk below
      (not (on-disk ?d ?dbelow))

      ;; source peg: new top is the disk that was below
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ;; target peg: moved disk becomes bottom/top on empty peg
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is on top of another disk onto another disk (target top).
  (:action move-on-disk-to-disk
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?dto - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove link to the disk below at source and update source top
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)

      ;; add link to target top disk, update target top
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)