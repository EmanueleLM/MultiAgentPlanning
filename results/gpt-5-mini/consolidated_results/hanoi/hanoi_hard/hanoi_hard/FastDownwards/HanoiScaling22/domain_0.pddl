(define (domain hanoi6)
  ; Tower of Hanoi, 6 disks. Domain uses only pos(disk,peg) as mutable state.
  ; Actions are explicit per-disk and per-direction to allow preconditions
  ; expressed with simple negative preconditions over pos(...) facts.
  :requirements :strips :typing :negative-preconditions
  :types disk peg

  :predicates
    (pos ?d - disk ?p - peg)        ; disk ?d is on peg ?p
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 is smaller than ?d2

  ; ----- Actions for the mover agent (single-disk atomic moves) -----
  ; Each action moves exactly one disk from one peg to another.
  ; Preconditions ensure the disk is on the source peg and that no strictly
  ; smaller disk is on the source (so the disk is top) and no strictly
  ; smaller disk is on the destination (so placing is legal).
  ; Effects change only pos for the moved disk.
  ;
  ; Directions allowed: left->middle, left->right, middle->left, middle->right, right->left, right->middle
  ; Disk set: A (smallest), B, C, D, E, F (largest)
  
  ; Disk A (smallest) - no smaller disks, so only require it to be on source.
  (:action move-A-left-middle
    :precondition (and (pos A left))
    :effect (and (not (pos A left)) (pos A middle))
  )
  (:action move-A-left-right
    :precondition (and (pos A left))
    :effect (and (not (pos A left)) (pos A right))
  )
  (:action move-A-middle-left
    :precondition (and (pos A middle))
    :effect (and (not (pos A middle)) (pos A left))
  )
  (:action move-A-middle-right
    :precondition (and (pos A middle))
    :effect (and (not (pos A middle)) (pos A right))
  )
  (:action move-A-right-left
    :precondition (and (pos A right))
    :effect (and (not (pos A right)) (pos A left))
  )
  (:action move-A-right-middle
    :precondition (and (pos A right))
    :effect (and (not (pos A right)) (pos A middle))
  )

  ; Disk B (smaller set: A)
  (:action move-B-left-middle
    :precondition (and (pos B left)
                       (not (pos A left))
                       (not (pos A middle)))
    :effect (and (not (pos B left)) (pos B middle))
  )
  (:action move-B-left-right
    :precondition (and (pos B left)
                       (not (pos A left))
                       (not (pos A right)))
    :effect (and (not (pos B left)) (pos B right))
  )
  (:action move-B-middle-left
    :precondition (and (pos B middle)
                       (not (pos A middle))
                       (not (pos A left)))
    :effect (and (not (pos B middle)) (pos B left))
  )
  (:action move-B-middle-right
    :precondition (and (pos B middle)
                       (not (pos A middle))
                       (not (pos A right)))
    :effect (and (not (pos B middle)) (pos B right))
  )
  (:action move-B-right-left
    :precondition (and (pos B right)
                       (not (pos A right))
                       (not (pos A left)))
    :effect (and (not (pos B right)) (pos B left))
  )
  (:action move-B-right-middle
    :precondition (and (pos B right)
                       (not (pos A right))
                       (not (pos A middle)))
    :effect (and (not (pos B right)) (pos B middle))
  )

  ; Disk C (smaller set: A, B)
  (:action move-C-left-middle
    :precondition (and (pos C left)
                       (not (pos A left)) (not (pos B left))
                       (not (pos A middle)) (not (pos B middle)))
    :effect (and (not (pos C left)) (pos C middle))
  )
  (:action move-C-left-right
    :precondition (and (pos C left)
                       (not (pos A left)) (not (pos B left))
                       (not (pos A right)) (not (pos B right)))
    :effect (and (not (pos C left)) (pos C right))
  )
  (:action move-C-middle-left
    :precondition (and (pos C middle)
                       (not (pos A middle)) (not (pos B middle))
                       (not (pos A left)) (not (pos B left)))
    :effect (and (not (pos C middle)) (pos C left))
  )
  (:action move-C-middle-right
    :precondition (and (pos C middle)
                       (not (pos A middle)) (not (pos B middle))
                       (not (pos A right)) (not (pos B right)))
    :effect (and (not (pos C middle)) (pos C right))
  )
  (:action move-C-right-left
    :precondition (and (pos C right)
                       (not (pos A right)) (not (pos B right))
                       (not (pos A left)) (not (pos B left)))
    :effect (and (not (pos C right)) (pos C left))
  )
  (:action move-C-right-middle
    :precondition (and (pos C right)
                       (not (pos A right)) (not (pos B right))
                       (not (pos A middle)) (not (pos B middle)))
    :effect (and (not (pos C right)) (pos C middle))
  )

  ; Disk D (smaller set: A, B, C)
  (:action move-D-left-middle
    :precondition (and (pos D left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)))
    :effect (and (not (pos D left)) (pos D middle))
  )
  (:action move-D-left-right
    :precondition (and (pos D left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)))
    :effect (and (not (pos D left)) (pos D right))
  )
  (:action move-D-middle-left
    :precondition (and (pos D middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)))
    :effect (and (not (pos D middle)) (pos D left))
  )
  (:action move-D-middle-right
    :precondition (and (pos D middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)))
    :effect (and (not (pos D middle)) (pos D right))
  )
  (:action move-D-right-left
    :precondition (and (pos D right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)))
    :effect (and (not (pos D right)) (pos D left))
  )
  (:action move-D-right-middle
    :precondition (and (pos D right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)))
    :effect (and (not (pos D right)) (pos D middle))
  )

  ; Disk E (smaller set: A, B, C, D)
  (:action move-E-left-middle
    :precondition (and (pos E left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)))
    :effect (and (not (pos E left)) (pos E middle))
  )
  (:action move-E-left-right
    :precondition (and (pos E left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)))
    :effect (and (not (pos E left)) (pos E right))
  )
  (:action move-E-middle-left
    :precondition (and (pos E middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)))
    :effect (and (not (pos E middle)) (pos E left))
  )
  (:action move-E-middle-right
    :precondition (and (pos E middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)))
    :effect (and (not (pos E middle)) (pos E right))
  )
  (:action move-E-right-left
    :precondition (and (pos E right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)))
    :effect (and (not (pos E right)) (pos E left))
  )
  (:action move-E-right-middle
    :precondition (and (pos E right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)))
    :effect (and (not (pos E right)) (pos E middle))
  )

  ; Disk F (largest) (smaller set: A, B, C, D, E)
  (:action move-F-left-middle
    :precondition (and (pos F left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)) (not (pos E left))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)) (not (pos E middle)))
    :effect (and (not (pos F left)) (pos F middle))
  )
  (:action move-F-left-right
    :precondition (and (pos F left)
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)) (not (pos E left))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)) (not (pos E right)))
    :effect (and (not (pos F left)) (pos F right))
  )
  (:action move-F-middle-left
    :precondition (and (pos F middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)) (not (pos E middle))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)) (not (pos E left)))
    :effect (and (not (pos F middle)) (pos F left))
  )
  (:action move-F-middle-right
    :precondition (and (pos F middle)
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)) (not (pos E middle))
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)) (not (pos E right)))
    :effect (and (not (pos F middle)) (pos F right))
  )
  (:action move-F-right-left
    :precondition (and (pos F right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)) (not (pos E right))
                       (not (pos A left)) (not (pos B left)) (not (pos C left)) (not (pos D left)) (not (pos E left)))
    :effect (and (not (pos F right)) (pos F left))
  )
  (:action move-F-right-middle
    :precondition (and (pos F right)
                       (not (pos A right)) (not (pos B right)) (not (pos C right)) (not (pos D right)) (not (pos E right))
                       (not (pos A middle)) (not (pos B middle)) (not (pos C middle)) (not (pos D middle)) (not (pos E middle)))
    :effect (and (not (pos F right)) (pos F middle))
  )

)