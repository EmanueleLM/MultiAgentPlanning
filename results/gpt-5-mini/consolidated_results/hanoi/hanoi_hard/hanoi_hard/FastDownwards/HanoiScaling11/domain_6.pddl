(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk ?d is directly on peg ?p (i.e., the bottom disk of that peg's stack)
    (on-peg ?d - disk ?p - peg)
    ;; disk ?d is directly on top of disk ?below
    (on-disk ?d - disk ?below - disk)
    ;; peg ?p has top disk ?d
    (top ?p - peg ?d - disk)
    ;; peg ?p is empty
    (empty ?p - peg)
    ;; disk ?x is smaller than disk ?y (size ordering invariant)
    (smaller ?x - disk ?y - disk)
    ;; temporal successor relation between stages
    (succ ?s - step ?s2 - step)
    ;; current stage marker
    (current ?s - step)
  )

  ;; Move a disk that is the sole disk on its source peg onto an empty target peg.
  ;; Preconditions ensure the disk is both the peg bottom (on-peg) and the peg top (top),
  ;; i.e., it is the only disk on the source peg.
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
      ;; source updates: remove disk from source peg, update top/empty
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (empty ?pfrom)

      ;; target updates: disk becomes bottom (and top) on empty target peg
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is the sole disk on its source peg onto another disk (target top).
  ;; The size constraint forbids placing a larger disk on a smaller one.
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

      ;; target stack grows: d becomes directly on dto and becomes new top
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is on top of another disk (?dbelow) onto an empty target peg.
  ;; Maintains the link between the disk below and its peg/below-disk by making that disk the new top.
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

      ;; source peg: moved disk no longer top; the disk that was below becomes the new top
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
  ;; Enforces size ordering and updates local stack relations.
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