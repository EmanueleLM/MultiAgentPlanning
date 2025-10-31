(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (at ?d - disk ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Disk A (smallest) - may move between any two pegs if it is on the source.
  (:action move-A-left-middle
    :parameters ()
    :precondition (and (at A left))
    :effect (and (not (at A left)) (at A middle))
  )
  (:action move-A-left-right
    :parameters ()
    :precondition (and (at A left))
    :effect (and (not (at A left)) (at A right))
  )
  (:action move-A-middle-left
    :parameters ()
    :precondition (and (at A middle))
    :effect (and (not (at A middle)) (at A left))
  )
  (:action move-A-middle-right
    :parameters ()
    :precondition (and (at A middle))
    :effect (and (not (at A middle)) (at A right))
  )
  (:action move-A-right-left
    :parameters ()
    :precondition (and (at A right))
    :effect (and (not (at A right)) (at A left))
  )
  (:action move-A-right-middle
    :parameters ()
    :precondition (and (at A right))
    :effect (and (not (at A right)) (at A middle))
  )

  ;; Disk B - can move only if A is not on the source and not on the destination.
  (:action move-B-left-middle
    :parameters ()
    :precondition (and (at B left) (not (at A left)) (not (at A middle)))
    :effect (and (not (at B left)) (at B middle))
  )
  (:action move-B-left-right
    :parameters ()
    :precondition (and (at B left) (not (at A left)) (not (at A right)))
    :effect (and (not (at B left)) (at B right))
  )
  (:action move-B-middle-left
    :parameters ()
    :precondition (and (at B middle) (not (at A middle)) (not (at A left)))
    :effect (and (not (at B middle)) (at B left))
  )
  (:action move-B-middle-right
    :parameters ()
    :precondition (and (at B middle) (not (at A middle)) (not (at A right)))
    :effect (and (not (at B middle)) (at B right))
  )
  (:action move-B-right-left
    :parameters ()
    :precondition (and (at B right) (not (at A right)) (not (at A left)))
    :effect (and (not (at B right)) (at B left))
  )
  (:action move-B-right-middle
    :parameters ()
    :precondition (and (at B right) (not (at A right)) (not (at A middle)))
    :effect (and (not (at B right)) (at B middle))
  )

  ;; Disk C - can move only if A and B are not on the source and not on the destination.
  (:action move-C-left-middle
    :parameters ()
    :precondition (and (at C left)
                       (not (at A left)) (not (at B left))
                       (not (at A middle)) (not (at B middle)))
    :effect (and (not (at C left)) (at C middle))
  )
  (:action move-C-left-right
    :parameters ()
    :precondition (and (at C left)
                       (not (at A left)) (not (at B left))
                       (not (at A right)) (not (at B right)))
    :effect (and (not (at C left)) (at C right))
  )
  (:action move-C-middle-left
    :parameters ()
    :precondition (and (at C middle)
                       (not (at A middle)) (not (at B middle))
                       (not (at A left)) (not (at B left)))
    :effect (and (not (at C middle)) (at C left))
  )
  (:action move-C-middle-right
    :parameters ()
    :precondition (and (at C middle)
                       (not (at A middle)) (not (at B middle))
                       (not (at A right)) (not (at B right)))
    :effect (and (not (at C middle)) (at C right))
  )
  (:action move-C-right-left
    :parameters ()
    :precondition (and (at C right)
                       (not (at A right)) (not (at B right))
                       (not (at A left)) (not (at B left)))
    :effect (and (not (at C right)) (at C left))
  )
  (:action move-C-right-middle
    :parameters ()
    :precondition (and (at C right)
                       (not (at A right)) (not (at B right))
                       (not (at A middle)) (not (at B middle)))
    :effect (and (not (at C right)) (at C middle))
  )

  ;; Disk D (largest) - can move only if A, B, and C are not on the source and not on the destination.
  (:action move-D-left-middle
    :parameters ()
    :precondition (and (at D left)
                       (not (at A left)) (not (at B left)) (not (at C left))
                       (not (at A middle)) (not (at B middle)) (not (at C middle)))
    :effect (and (not (at D left)) (at D middle))
  )
  (:action move-D-left-right
    :parameters ()
    :precondition (and (at D left)
                       (not (at A left)) (not (at B left)) (not (at C left))
                       (not (at A right)) (not (at B right)) (not (at C right)))
    :effect (and (not (at D left)) (at D right))
  )
  (:action move-D-middle-left
    :parameters ()
    :precondition (and (at D middle)
                       (not (at A middle)) (not (at B middle)) (not (at C middle))
                       (not (at A left)) (not (at B left)) (not (at C left)))
    :effect (and (not (at D middle)) (at D left))
  )
  (:action move-D-middle-right
    :parameters ()
    :precondition (and (at D middle)
                       (not (at A middle)) (not (at B middle)) (not (at C middle))
                       (not (at A right)) (not (at B right)) (not (at C right)))
    :effect (and (not (at D middle)) (at D right))
  )
  (:action move-D-right-left
    :parameters ()
    :precondition (and (at D right)
                       (not (at A right)) (not (at B right)) (not (at C right))
                       (not (at A left)) (not (at B left)) (not (at C left)))
    :effect (and (not (at D right)) (at D left))
  )
  (:action move-D-right-middle
    :parameters ()
    :precondition (and (at D right)
                       (not (at A right)) (not (at B right)) (not (at C right))
                       (not (at A middle)) (not (at B middle)) (not (at C middle)))
    :effect (and (not (at D right)) (at D middle))
  )
)