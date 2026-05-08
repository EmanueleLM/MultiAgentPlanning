(define (domain block-stacking)
  (:requirements :strips :typing)
  (:types block time)

  (:predicates
    (on ?b - block ?p - block)    ; ?b is directly on ?p
    (ontable ?b - block)          ; ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b and ?b is not being held
    (handempty)                   ; hand is empty
    (holding ?b - block)          ; currently holding ?b
    (at ?t - time)                ; current stage marker
    (next ?t1 - time ?t2 - time)  ; successor relation between consecutive stages
  )

  ;; Unstack a block ?b from on top of block ?p during consecutive stages ?t -> ?t2
  (:action unstack
    :parameters (?b - block ?p - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (on ?b ?p)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?p))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (clear ?p)
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Pick up a block ?b from the table during consecutive stages ?t -> ?t2
  (:action pickup
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Put down a held block ?b onto the table during consecutive stages ?t -> ?t2
  (:action putdown
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      (clear ?b)
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Stack a held block ?b onto a clear block ?p during consecutive stages ?t -> ?t2
  (:action stack
    :parameters (?b - block ?p - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?b)
      (clear ?p)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?p)
      (not (clear ?p))
      (clear ?b)
      (not (ontable ?b))
      (not (at ?t))
      (at ?t2)
    )
  )
)