(define (domain blocks)
  :requirements :strips :typing :negative-preconditions
  :types block
  :predicates
    (block ?b - block)
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
  ;; PickUp: take a clear block from the table into the single hand
  (:action PickUp
    :parameters (?b - block)
    :precondition (and
      (block ?b)
      (clear ?b)
      (ontable ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )
  ;; Unstack: take a clear block from on top of another block into the single hand
  (:action Unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (block ?b)
      (block ?c)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )
  ;; PutDown: place a held block down on the table
  (:action PutDown
    :parameters (?b - block)
    :precondition (and
      (block ?b)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
  )
  ;; Stack: place a held block on top of a clear block
  (:action Stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (block ?b)
      (block ?c)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
  )
)