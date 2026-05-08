(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions :derived-predicates)
  (:types disk peg)

  ;; Predicates
  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly supported by peg
    (on-disk ?d - disk ?below - disk) ; disk directly supported by another disk
    (top ?p - peg ?d - disk)         ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg has no disks
    (next ?s - disk ?b - disk)       ; immediate size successor (static adjacency)
  )

  ;; Derived predicate: transitive "smaller" relation computed from immediate adjacency.
  ;; This lets the :init list contain only the adjacency links (linear chain),
  ;; rather than enumerating every pairwise smaller relation.
  (:derived (smaller ?x - disk ?y - disk)
    (or
      (next ?x ?y)
      (exists (?z - disk) (and (next ?x ?z) (smaller ?z ?y)))
    )
  )

  ;; Player-attributable primitive move actions.
  ;; Each action moves a top disk from a source peg to a destination peg,
  ;; covering cases where source support / destination support differ.
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

  (:action player-move-from-peg-to-disk
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
      (top ?pto ?d)
      (not (top ?pto ?dto))
      (empty ?pfrom)
    )
  )

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
      (top ?pfrom ?dbelow)
      (on-peg ?d ?pto)
      (top ?pto ?d)
      (not (empty ?pto))
    )
  )

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