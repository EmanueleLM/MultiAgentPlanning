(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  ;; Moves for disk A (smallest): can move if it is on the source peg
  (:action move-A-left-middle
    :precondition (and (on A left))
    :effect (and (not (on A left)) (on A middle))
  )
  (:action move-A-left-right
    :precondition (and (on A left))
    :effect (and (not (on A left)) (on A right))
  )
  (:action move-A-middle-left
    :precondition (and (on A middle))
    :effect (and (not (on A middle)) (on A left))
  )
  (:action move-A-middle-right
    :precondition (and (on A middle))
    :effect (and (not (on A middle)) (on A right))
  )
  (:action move-A-right-left
    :precondition (and (on A right))
    :effect (and (not (on A right)) (on A left))
  )
  (:action move-A-right-middle
    :precondition (and (on A right))
    :effect (and (not (on A right)) (on A middle))
  )

  ;; Moves for disk B: B must be on source and A (smaller) must not be on source;
  ;; destination must not contain A.
  (:action move-B-left-middle
    :precondition (and (on B left) (not (on A left)) (not (on A middle)))
    :effect (and (not (on B left)) (on B middle))
  )
  (:action move-B-left-right
    :precondition (and (on B left) (not (on A left)) (not (on A right)))
    :effect (and (not (on B left)) (on B right))
  )
  (:action move-B-middle-left
    :precondition (and (on B middle) (not (on A middle)) (not (on A left)))
    :effect (and (not (on B middle)) (on B left))
  )
  (:action move-B-middle-right
    :precondition (and (on B middle) (not (on A middle)) (not (on A right)))
    :effect (and (not (on B middle)) (on B right))
  )
  (:action move-B-right-left
    :precondition (and (on B right) (not (on A right)) (not (on A left)))
    :effect (and (not (on B right)) (on B left))
  )
  (:action move-B-right-middle
    :precondition (and (on B right) (not (on A right)) (not (on A middle)))
    :effect (and (not (on B right)) (on B middle))
  )

  ;; Moves for disk C: C must be on source and A,B must not be on source;
  ;; destination must not contain A or B.
  (:action move-C-left-middle
    :precondition (and (on C left)
                       (not (on A left)) (not (on B left))
                       (not (on A middle)) (not (on B middle)))
    :effect (and (not (on C left)) (on C middle))
  )
  (:action move-C-left-right
    :precondition (and (on C left)
                       (not (on A left)) (not (on B left))
                       (not (on A right)) (not (on B right)))
    :effect (and (not (on C left)) (on C right))
  )
  (:action move-C-middle-left
    :precondition (and (on C middle)
                       (not (on A middle)) (not (on B middle))
                       (not (on A left)) (not (on B left)))
    :effect (and (not (on C middle)) (on C left))
  )
  (:action move-C-middle-right
    :precondition (and (on C middle)
                       (not (on A middle)) (not (on B middle))
                       (not (on A right)) (not (on B right)))
    :effect (and (not (on C middle)) (on C right))
  )
  (:action move-C-right-left
    :precondition (and (on C right)
                       (not (on A right)) (not (on B right))
                       (not (on A left)) (not (on B left)))
    :effect (and (not (on C right)) (on C left))
  )
  (:action move-C-right-middle
    :precondition (and (on C right)
                       (not (on A right)) (not (on B right))
                       (not (on A middle)) (not (on B middle)))
    :effect (and (not (on C right)) (on C middle))
  )

  ;; Moves for disk D (largest): D must be on source and A,B,C must not be on source;
  ;; destination must not contain A,B,C.
  (:action move-D-left-middle
    :precondition (and (on D left)
                       (not (on A left)) (not (on B left)) (not (on C left))
                       (not (on A middle)) (not (on B middle)) (not (on C middle)))
    :effect (and (not (on D left)) (on D middle))
  )
  (:action move-D-left-right
    :precondition (and (on D left)
                       (not (on A left)) (not (on B left)) (not (on C left))
                       (not (on A right)) (not (on B right)) (not (on C right)))
    :effect (and (not (on D left)) (on D right))
  )
  (:action move-D-middle-left
    :precondition (and (on D middle)
                       (not (on A middle)) (not (on B middle)) (not (on C middle))
                       (not (on A left)) (not (on B left)) (not (on C left)))
    :effect (and (not (on D middle)) (on D left))
  )
  (:action move-D-middle-right
    :precondition (and (on D middle)
                       (not (on A middle)) (not (on B middle)) (not (on C middle))
                       (not (on A right)) (not (on B right)) (not (on C right)))
    :effect (and (not (on D middle)) (on D right))
  )
  (:action move-D-right-left
    :precondition (and (on D right)
                       (not (on A right)) (not (on B right)) (not (on C right))
                       (not (on A left)) (not (on B left)) (not (on C left)))
    :effect (and (not (on D right)) (on D left))
  )
  (:action move-D-right-middle
    :precondition (and (on D right)
                       (not (on A right)) (not (on B right)) (not (on C right))
                       (not (on A middle)) (not (on B middle)) (not (on C middle)))
    :effect (and (not (on D right)) (on D middle))
  )
)