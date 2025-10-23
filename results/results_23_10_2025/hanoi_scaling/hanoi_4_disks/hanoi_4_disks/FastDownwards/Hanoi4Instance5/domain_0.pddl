(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (at ?d - disk ?p - peg)            ; disk ?d is on peg ?p (somewhere in the stack)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
  )

  ;; Move actions for each ordered peg pair and for each disk.
  ;; Preconditions enforce that the moved disk is the top disk on the source peg
  ;; (no strictly smaller disk is located on the source), and that no strictly
  ;; smaller disk is on the destination peg (so we never place a larger disk
  ;; onto a smaller one). Effects simply relocate the disk.

  ;; Helper note: For 4 disks the "smaller" sets are:
  ;; A: {}
  ;; B: {A}
  ;; C: {A, B}
  ;; D: {A, B, C}

  ;; Actions moving disk A (no smaller disks to check)
  (:action move-left-middle-A
    :precondition (and (at A left))
    :effect (and (not (at A left)) (at A middle))
  )

  (:action move-left-right-A
    :precondition (and (at A left))
    :effect (and (not (at A left)) (at A right))
  )

  (:action move-middle-left-A
    :precondition (and (at A middle))
    :effect (and (not (at A middle)) (at A left))
  )

  (:action move-middle-right-A
    :precondition (and (at A middle))
    :effect (and (not (at A middle)) (at A right))
  )

  (:action move-right-left-A
    :precondition (and (at A right))
    :effect (and (not (at A right)) (at A left))
  )

  (:action move-right-middle-A
    :precondition (and (at A right))
    :effect (and (not (at A right)) (at A middle))
  )

  ;; Actions moving disk B (must ensure A is not on source or destination)
  (:action move-left-middle-B
    :precondition (and (at B left) (not (at A left)) (not (at A middle)))
    :effect (and (not (at B left)) (at B middle))
  )

  (:action move-left-right-B
    :precondition (and (at B left) (not (at A left)) (not (at A right)))
    :effect (and (not (at B left)) (at B right))
  )

  (:action move-middle-left-B
    :precondition (and (at B middle) (not (at A middle)) (not (at A left)))
    :effect (and (not (at B middle)) (at B left))
  )

  (:action move-middle-right-B
    :precondition (and (at B middle) (not (at A middle)) (not (at A right)))
    :effect (and (not (at B middle)) (at B right))
  )

  (:action move-right-left-B
    :precondition (and (at B right) (not (at A right)) (not (at A left)))
    :effect (and (not (at B right)) (at B left))
  )

  (:action move-right-middle-B
    :precondition (and (at B right) (not (at A right)) (not (at A middle)))
    :effect (and (not (at B right)) (at B middle))
  )

  ;; Actions moving disk C (must ensure A and B are not on source or destination)
  (:action move-left-middle-C
    :precondition (and (at C left)
                       (not (at A left)) (not (at B left))
                       (not (at A middle)) (not (at B middle)))
    :effect (and (not (at C left)) (at C middle))
  )

  (:action move-left-right-C
    :precondition (and (at C left)
                       (not (at A left)) (not (at B left))
                       (not (at A right)) (not (at B right)))
    :effect (and (not (at C left)) (at C right))
  )

  (:action move-middle-left-C
    :precondition (and (at C middle)
                       (not (at A middle)) (not (at B middle))
                       (not (at A left)) (not (at B left)))
    :effect (and (not (at C middle)) (at C left))
  )

  (:action move-middle-right-C
    :precondition (and (at C middle)
                       (not (at A middle)) (not (at B middle))
                       (not (at A right)) (not (at B right)))
    :effect (and (not (at C middle)) (at C right))
  )

  (:action move-right-left-C
    :precondition (and (at C right)
                       (not (at A right)) (not (at B right))
                       (not (at A left)) (not (at B left)))
    :effect (and (not (at C right)) (at C left))
  )

  (:action move-right-middle-C
    :precondition (and (at C right)
                       (not (at A right)) (not (at B right))
                       (not (at A middle)) (not (at B middle)))
    :effect (and (not (at C right)) (at C middle))
  )

  ;; Actions moving disk D (must ensure A, B and C are not on source or destination)
  (:action move-left-middle-D
    :precondition (and (at D left)
                       (not (at A left)) (not (at B left)) (not (at C left))
                       (not (at A middle)) (not (at B middle)) (not (at C middle)))
    :effect (and (not (at D left)) (at D middle))
  )

  (:action move-left-right-D
    :precondition (and (at D left)
                       (not (at A left)) (not (at B left)) (not (at C left))
                       (not (at A right)) (not (at B right)) (not (at C right)))
    :effect (and (not (at D left)) (at D right))
  )

  (:action move-middle-left-D
    :precondition (and (at D middle)
                       (not (at A middle)) (not (at B middle)) (not (at C middle))
                       (not (at A left)) (not (at B left)) (not (at C left)))
    :effect (and (not (at D middle)) (at D left))
  )

  (:action move-middle-right-D
    :precondition (and (at D middle)
                       (not (at A middle)) (not (at B middle)) (not (at C middle))
                       (not (at A right)) (not (at B right)) (not (at C right)))
    :effect (and (not (at D middle)) (at D right))
  )

  (:action move-right-left-D
    :precondition (and (at D right)
                       (not (at A right)) (not (at B right)) (not (at C right))
                       (not (at A left)) (not (at B left)) (not (at C left)))
    :effect (and (not (at D right)) (at D left))
  )

  (:action move-right-middle-D
    :precondition (and (at D right)
                       (not (at A right)) (not (at B right)) (not (at C right))
                       (not (at A middle)) (not (at B middle)) (not (at C middle)))
    :effect (and (not (at D right)) (at D middle))
  )

)