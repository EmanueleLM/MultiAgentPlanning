(define (domain blocks-world-with-time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)        ; block x is on block y
    (ontable ?x - block)              ; block x is on the table
    (clear ?x - block)                ; nothing on block x
    (holding ?x - block)              ; robot is holding block x
    (handempty)                       ; robot hand is empty
    (now ?t - step)                   ; current time step token
    (succ ?t - step ?t2 - step)       ; successor relation over steps
  )

  ;; Pickup a clear block from the table at time ?t, advancing to its successor ?t2
  (:action pickup
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Put down a held block onto the table at time ?t, advancing to ?t2
  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (now ?t) (succ ?t ?t2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Unstack a clear block ?b from on top of ?under at time ?t, advancing to ?t2
  (:action unstack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (on ?b ?under) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Stack a held block ?b onto a clear block ?under at time ?t, advancing to ?t2
  (:action stack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (clear ?under) (now ?t) (succ ?t ?t2))
    :effect (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?under))
      (not (now ?t))
      (now ?t2)
    )
  )
)