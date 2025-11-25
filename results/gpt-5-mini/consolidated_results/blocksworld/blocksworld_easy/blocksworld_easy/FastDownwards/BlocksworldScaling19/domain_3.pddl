(define (domain block-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?p - block)        ; block ?b is on block ?p
    (ontable ?b - block)              ; block ?b is on the table
    (clear ?b - block)                ; no block on top of ?b AND ?b is not held
    (handempty)                       ; hand is empty
    (holding ?b - block)              ; holding block ?b
    (at ?t - time)                    ; current stage/time marker
    (next ?t1 - time ?t2 - time)      ; successor relation for stages
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
      (not (clear ?b))    ; held blocks are not clear
      (clear ?p)          ; removing top makes supporting block clear
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
      (not (clear ?b))    ; held blocks are not clear
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
      (clear ?b)          ; when placed on table with nothing on top, block is clear
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
      (not (= ?b ?p))
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?p)
      (not (clear ?p))    ; target now has something on top
      (clear ?b)          ; placed block is top and hence clear
      (not (ontable ?b))  ; ensure b is not marked as on the table
      (not (at ?t))
      (at ?t2)
    )
  )
)