(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; Predicates
  (:predicates
    (on-peg ?d - disk ?p - peg)    ; disk directly supported by peg
    (on-disk ?d - disk ?below - disk) ; disk directly supported by another disk
    (top ?p - peg ?d - disk)       ; ?d is the top disk on peg ?p
    (empty ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2 (static)
  )

  ;; Actions attributable to the player's primitive moves.
  ;; These four action schemas cover all combinations of:
  ;; - whether the moved disk is directly on a peg or on another disk (source support),
  ;; - and whether the destination peg is empty or has a top disk to place onto.
  ;; No conditional effects or derived predicates are used; every necessary supporter/top
  ;; identity is supplied as an action parameter so effects are fully explicit.

  ;; 1) Move a top disk that is directly on a peg onto an empty peg.
  (:action player-move-from-peg-to-empty
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

  ;; 2) Move a top disk that is directly on a peg onto the top disk of another peg.
  (:action player-move-from-peg-to-disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?dto - disk)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?pfrom ?d)
      (top ?pto ?dto)
      (smaller ?d ?dto)  ; enforce "no larger on smaller"
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (not (top ?pfrom ?d))
      (on-disk ?d ?dto)
      (top ?pto ?d)
      (not (top ?pto ?dto))
      (empty ?pfrom)
    )
  )

  ;; 3) Move a top disk that is directly on another disk onto an empty peg.
  (:action player-move-from-disk-to-empty
    :parameters (?d - disk ?dbelow - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-disk ?d ?dbelow)
      (top ?pfrom ?d)
      (empty ?pto)
    )
    :effect (and
      (not (on-disk ?d ?dbelow))
      (not (top ?pfrom ?d))
      (top ?pfrom ?dbelow)   ; the disk that was below becomes the new top of pfrom
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))
    )
  )

  ;; 4) Move a top disk that is directly on another disk onto the top disk of another peg.
  (:action player-move-from-disk-to-disk
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