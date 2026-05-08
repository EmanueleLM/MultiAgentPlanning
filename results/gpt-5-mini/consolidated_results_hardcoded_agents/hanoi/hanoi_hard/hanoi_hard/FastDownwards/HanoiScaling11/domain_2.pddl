(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly supported by peg
    (on-disk ?d - disk ?below - disk) ; disk directly supported by another disk
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?x - disk ?y - disk)     ; ?x is strictly smaller than ?y (static)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (empty ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (empty ?pfrom)
      (not (empty ?pto))
    )
  )

  ;; Move a top disk that is directly on a peg to sit on top of another top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?dto - disk)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)
      (empty ?pfrom)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (empty ?pto)
    )
    :effect (and
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))
    )
  )

  ;; Move a top disk that is directly on another disk to sit on top of another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg ?dto - disk)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)
    )
    :effect (and
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)
      (on-disk ?d ?dto)
      (not (top ?pto ?dto))
      (top ?pto ?d)
    )
  )
)